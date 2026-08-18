-- Runner pane control, backed by herdr's pane CLI.
--
-- Replaces benmills/vimux, which drove the same workflow by shelling out to
-- `tmux`. Same idea: keep one scratch pane below the editor, throw commands at
-- it, re-run the last one. Vimux keymaps live in user/keymaps.lua.

local M = {}

local state = {
  runner = nil,       -- pane_id of the scratch runner pane
  last_command = nil,
}

local function call(...)
  local args = { ... }
  local result = vim.system(vim.list_extend({ 'herdr' }, args), { text = true }):wait()
  if result.code ~= 0 then
    vim.notify(
      ('herdr %s: %s'):format(table.concat(args, ' '), vim.trim(result.stderr or '')),
      vim.log.levels.ERROR
    )
    return nil
  end
  local ok, decoded = pcall(vim.json.decode, result.stdout)
  return ok and decoded.result or nil
end

-- Set by herdr for processes it launched. Falls back to asking the server which
-- pane has focus, which covers nvim started outside a herdr pane.
local function editor_pane()
  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= '' then
    return vim.env.HERDR_PANE_ID
  end
  local result = call('pane', 'current')
  return result and result.pane and result.pane.pane_id
end

local function pane_exists(pane_id)
  local result = call('pane', 'list')
  for _, pane in ipairs(result and result.panes or {}) do
    if pane.pane_id == pane_id then return true end
  end
  return false
end

local function runner_pane()
  if state.runner and pane_exists(state.runner) then
    return state.runner
  end

  local editor = editor_pane()
  if not editor then
    vim.notify('herdr: no pane to split, is nvim running inside herdr?', vim.log.levels.WARN)
    return nil
  end

  local result = call('pane', 'split', editor, '--direction', 'down', '--ratio', '0.25')
  state.runner = result and result.pane and result.pane.pane_id
  if state.runner then
    call('pane', 'rename', state.runner, 'runner')
  end
  return state.runner
end

-- VimuxRunCommand
function M.run(command)
  local runner = runner_pane()
  if not runner then return end
  state.last_command = command
  call('pane', 'run', runner, command)
end

-- VimuxPromptCommand
function M.prompt()
  vim.ui.input({ prompt = 'Command? ', completion = 'shellcmd' }, function(command)
    if command and command ~= '' then M.run(command) end
  end)
end

-- VimuxRunLastCommand
function M.run_last()
  if not state.last_command then return M.prompt() end
  M.run(state.last_command)
end

-- VimuxInspectRunner. herdr focuses by direction rather than by id, and the
-- runner is always the split below.
function M.inspect()
  if not (state.runner and pane_exists(state.runner)) then return end
  local editor = editor_pane()
  if editor then call('pane', 'focus', '--pane', editor, '--direction', 'down') end
end

-- VimuxZoomRunner
function M.zoom()
  if state.runner and pane_exists(state.runner) then
    call('pane', 'zoom', state.runner, '--toggle')
  end
end

-- VimuxCloseRunner
function M.close()
  if state.runner and pane_exists(state.runner) then
    call('pane', 'close', state.runner)
  end
  state.runner = nil
end

return M
