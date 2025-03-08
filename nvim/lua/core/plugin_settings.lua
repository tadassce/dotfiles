-- Netrw
vim.g.netrw_list_hide = '.*\\.DS_Store$'

-- Ragtag
vim.g.ragtag_global_maps = 1

-- NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrowExpandable = '+'
vim.g.NERDTreeDirArrowCollapsible = '~'

-- Gist
vim.g.gist_clip_command = 'pbcopy'

-- CtrlSpace
vim.g.CtrlSpaceSetDefaultMapping = 0

-- Switch (for toggling TODO items)
vim.g.todo_switch_definition = {
  ['- \\[ \\]\\(.*\\)$'] = '- [x]\\1',
  ['- \\[x\\]\\(.*\\)$'] = '- [ ]\\1',
}
-- Alternative toggle cycle:
-- vim.g.todo_switch_definition = {
--   ['- \\[ \\]\\(.*\\)$'] = '- [x]\\1',
--   ['- \\[x\\]\\(.*\\)$'] = '- [-]\\1',
--   ['- \\[-\\]\\(.*\\)$'] = '- [ ]\\1',
-- }
vim.g.switch_custom_definitions = { vim.g.todo_switch_definition }

-- Slime
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "1.2" }
vim.g.slime_dont_ask_default = 1

-- Vroom (commented out in original)
-- vim.g.vroom_use_vimux = 1

-- Closetag
vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'

-- JSX
vim.g.jsx_ext_required = 0

-- Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 0

-- ALE - Asynchronous Lint Engine
vim.g.ale_sign_error = '! '
vim.g.ale_sign_warning = '. '
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_pattern_options = {
  ['db/schema\\.rb$'] = { ale_enabled = 0 },
}
vim.g.ale_linters = {
  ruby = { 'brakeman', 'reek', 'rubocop', 'ruby', 'sorbet' },
  javascript = { 'standard' },
  markdown = { 'proselint' }
}
-- vim.g.ale_fixers = { ruby = { 'standardrb' }, javascript = { 'standard' } }
-- vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_enter = 0

vim.cmd('highlight clear ALEErrorSign')
vim.cmd('highlight clear ALEWarningSign')

-- Lightline helpers
_G.lightline_filename = function()
  return vim.fn.expand('%:t') ~= '' and vim.fn.expand('%:.') or 'New'
end

_G.lightline_linter_warnings = function()
  local counts = vim.fn['ale#statusline#Count'](vim.fn.bufnr(''))
  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors
  return counts.total == 0 and '' or string.format('%d ◆', all_non_errors)
end

_G.lightline_linter_errors = function()
  local counts = vim.fn['ale#statusline#Count'](vim.fn.bufnr(''))
  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors
  return counts.total == 0 and '' or string.format('%d ✗', all_errors)
end

_G.lightline_linter_ok = function()
  local counts = vim.fn['ale#statusline#Count'](vim.fn.bufnr(''))
  local all_errors = counts.error + counts.style_error
  local all_non_errors = counts.total - all_errors
  return counts.total == 0 and '✓ ' or ''
end

-- Update Lightline on lint
local function maybe_update_lightline()
  if vim.fn.exists('#lightline') ~= 0 then
    vim.fn['lightline#update']()
  end
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'ALELint',
  callback = maybe_update_lightline
})

-- Lightline configuration
vim.g.lightline = {
  colorscheme = vim.g.lightlinetheme,
  active = {
    left = {{'mode', 'paste', 'gitbranch'}, {'filename', 'modified'}},
    right = {{'lineinfo'}, {'percent'}, {'readonly', 'linter_warnings', 'linter_errors', 'linter_ok'}}
  },
  mode_map = {
    n = 'N',
    i = 'I',
    R = 'R',
    v = 'V',
    V = 'VL',
    ['<C-v>'] = 'VB',
    c = 'C',
    s = 'S',
    S = 'SL',
    ['<C-s>'] = 'SB',
    t = 'T',
  },
  component_expand = {
    linter_warnings = 'v:lua.lightline_linter_warnings',
    linter_errors = 'v:lua.lightline_linter_errors',
    linter_ok = 'v:lua.lightline_linter_ok'
  },
  component_type = {
    readonly = 'error',
    linter_warnings = 'warning',
    linter_errors = 'error'
  },
  component_function = {
    filename = 'v:lua.lightline_filename',
  },
}

-- FZF colors
vim.g.fzf_colors = {
  fg = {'fg', 'Normal'},
  bg = {'bg', 'Normal'},
  hl = {'fg', 'PreProc'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  info = {'fg', 'PreProc'},
  border = {'fg', 'Ignore'},
  prompt = {'fg', 'Conditional'},
  pointer = {'fg', 'Exception'},
  marker = {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header = {'fg', 'Normal'}
}

-- Copilot
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {expr = true, silent = true, script = true})
vim.g.copilot_no_tab_map = true

-- Uncomment to disable copilot on startup
-- vim.api.nvim_create_autocmd('VimEnter', {
--   pattern = '*',
--   command = 'Copilot disable'
-- })

-- Supermaven (commented out in original)
--[[
require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<C-j>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-k>",
  },
  ignore_filetypes = { cpp = true }, -- or { "cpp", }
  color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  }
})
--]]

-- Avante (commented out in original)
--[[
require('avante').setup()
--]]