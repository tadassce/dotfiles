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

	let windowId: string | undefined;
	let baseName: string | undefined;
	let waitingForInput = false;
	let renameQueue: Promise<void> = Promise.resolve();

	async function updateWindow(state: WindowState): Promise<void> {
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
					`${prefixes[state]}${baseName}`,
				]);
			})
			.catch(() => undefined);

		return renameQueue;
	}

	pi.on("session_start", async () => {
		waitingForInput = true;
		await updateWindow("waiting");
	});

	pi.on("agent_start", async () => {
		waitingForInput = false;
		await updateWindow("working");
	});

	pi.on("agent_settled", async () => {
		await updateWindow(waitingForInput ? "waiting" : "done");
	});

	pi.on("session_shutdown", async () => {
		await updateWindow("done");
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
			await updateWindow("waiting");
			return {
				content: [{ type: "text", text: "The tmux window is marked as waiting for user input." }],
				details: {},
			};
		},
	});
}
