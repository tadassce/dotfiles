import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { Type } from "typebox";

type WindowState = "working" | "waiting" | "done";

const prefixes: Record<WindowState, string> = {
	working: "🤖:",
	waiting: "✋:",
	done: "✅:",
};
const statusPrefix = /^(?:🤖|✋|✅):/u;

export default function (pi: ExtensionAPI) {
	const paneId = process.env.TMUX_PANE;
	if (!process.env.TMUX || !paneId) return;

	const paneNumber = Number.parseInt(paneId.replace(/^%/, ""), 10);
	if (!Number.isInteger(paneNumber)) return;

	const focusHooks = [
		"after-select-pane",
		"session-window-changed",
		"client-session-changed",
		"client-attached",
	] as const;
	const hookIndex = 1_000_000 + paneNumber;
	const baseNameOption = `@pi_window_status_base_${paneNumber}`;

	let windowId: string | undefined;
	let baseName: string | undefined;
	let waitingForInput = false;
	let windowState: WindowState | undefined;
	let renameQueue: Promise<void> = Promise.resolve();

	async function updateWindow(state?: WindowState): Promise<void> {
		renameQueue = renameQueue
			.then(async () => {
				if (!windowId || !baseName) {
					const result = await pi.exec("tmux", [
						"display-message",
						"-p",
						"-t",
						paneId,
						"#{window_id}\t#{window_name}\t#{b:pane_current_path}",
					]);
					if (result.code !== 0) return;

					const [targetWindowId, currentName, currentDirectory] = result.stdout.trimEnd().split("\t");
					windowId = targetWindowId || undefined;
					baseName = statusPrefix.test(currentName ?? "")
						? currentDirectory || currentName?.replace(statusPrefix, "")
						: currentName;
				}
				if (!windowId || !baseName) return;

				await pi.exec("tmux", [
					"rename-window",
					"-t",
					windowId,
					`${state ? prefixes[state] : ""}${baseName}`,
				]);
			})
			.catch(() => undefined);

		return renameQueue;
	}

	async function installFocusHooks(): Promise<void> {
		if (!windowId || !baseName) return;

		const optionResult = await pi.exec("tmux", [
			"set-option",
			"-w",
			"-t",
			windowId,
			baseNameOption,
			baseName,
		]);
		if (optionResult.code !== 0) return;

		const condition = `#{&&:#{==:#{pane_id},${paneId}},#{m/r:^(✋|✅):,#{window_name}}}`;
		const command = `if-shell -F '${condition}' 'rename-window -t ${windowId} "#{${baseNameOption}}"'`;

		for (const hook of focusHooks) {
			await pi.exec("tmux", ["set-hook", "-g", `${hook}[${hookIndex}]`, command]);
		}
	}

	async function removeFocusHooks(): Promise<void> {
		for (const hook of focusHooks) {
			await pi.exec("tmux", ["set-hook", "-gu", `${hook}[${hookIndex}]`]);
		}

		if (windowId) {
			await pi.exec("tmux", ["set-option", "-uw", "-t", windowId, baseNameOption]);
		}
	}

	async function restoreAutomaticRename(): Promise<void> {
		if (!windowId) return;

		// rename-window creates a per-window "off" override. Remove it so the
		// window inherits the user's global automatic-rename setting again.
		await pi.exec("tmux", [
			"set-option",
			"-uw",
			"-t",
			windowId,
			"automatic-rename",
		]);
	}

	async function clearAttentionIfFocused(attentionState: WindowState): Promise<void> {
		const result = await pi.exec("tmux", [
			"display-message",
			"-p",
			"-t",
			paneId,
			"#{pane_active}\t#{window_active_clients}",
		]);
		if (result.code !== 0) return;

		const [paneActive, activeClients] = result.stdout.trimEnd().split("\t");
		if (
			paneActive !== "1" ||
			Number(activeClients) < 1 ||
			windowState !== attentionState
		) {
			return;
		}

		windowState = undefined;
		await updateWindow();
	}

	async function setWindowState(state?: WindowState): Promise<void> {
		windowState = state;
		await updateWindow(state);

		if ((state === "waiting" || state === "done") && windowState === state) {
			await clearAttentionIfFocused(state);
		}
	}

	pi.on("session_start", async () => {
		waitingForInput = false;
		await setWindowState();
		await installFocusHooks();
	});

	pi.on("agent_start", async () => {
		waitingForInput = false;
		await setWindowState("working");
	});

	pi.on("agent_settled", async () => {
		if (!waitingForInput) await setWindowState("done");
	});

	pi.on("session_shutdown", async () => {
		await removeFocusHooks();
		await setWindowState();
		await restoreAutomaticRename();
	});

	pi.registerTool({
		name: "mark_tmux_waiting",
		label: "Mark tmux waiting",
		description: "Mark this pi session's tmux window as waiting for required user input.",
		promptSnippet: "Mark the tmux window as waiting when user input is required before work can continue",
		promptGuidelines: [
			"Call mark_tmux_waiting immediately before asking the user for information or a decision required to continue. Do not call it for optional follow-up offers or after completing the requested work.",
		],
		parameters: Type.Object({}),
		async execute() {
			waitingForInput = true;
			await setWindowState("waiting");
			return {
				content: [{ type: "text", text: "The tmux window is marked as waiting for user input." }],
				details: {},
			};
		},
	});
}
