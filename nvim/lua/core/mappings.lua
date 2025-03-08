-- Set leader key
vim.g.mapleader = ","

-- Basic mappings
vim.keymap.set('i', '<tab>', '<c-n>')

-- Window navigation
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Open or create files
vim.keymap.set('n', 'gF', ':edit <cfile><cr>')

-- Config editing shortcuts
vim.keymap.set('n', '<leader>ve', ':e ~/.config/nvim/init.lua<cr>')
vim.keymap.set('n', '<leader>vv', ':source ~/.config/nvim/init.lua<cr>')

-- Remap number increment
vim.keymap.set('n', '<c-s>', '<c-a>')

-- Toggle status line
vim.keymap.set('n', '[ts', ':set laststatus=2<cr>')
vim.keymap.set('n', ']ts', ':set laststatus=0<cr>')

-- Disable Ex mode
vim.keymap.set('n', 'Q', '<nop>')

-- Tab navigation
vim.keymap.set('n', ']w', ':tabn<cr>')
vim.keymap.set('n', '[w', ':tabp<cr>')

-- Copy current filename to clipboard
vim.keymap.set('n', 'cp', ':let @+ = expand("%")<CR>')

-- Format XML
vim.keymap.set('n', '<leader>x', ':%!xmllint --format -<cr>')

-- Quicklook
vim.keymap.set('n', '<leader>ql', ':!qlmanage -p %<cr>')

-- Open with default app
vim.keymap.set('n', '<leader>xx', ':!open %<cr>')

-- Open word/URL under cursor in a browser
vim.keymap.set('n', '<leader>xo', ':!open <cWORD><cr>')

-- Open with iA Writer
vim.keymap.set('n', '<leader>ia', ':!open "%" -a "iA Writer"<cr>')

-- Notes
vim.keymap.set('n', '<leader>nn', ':cd ~/Notes<cr>')
vim.keymap.set('n', '<leader>nj', ':cd ~/Notes<cr>:e journal.md<cr>Go# <c-d><cr>-<space>')

-- Insert / Snippets
-- Current date
vim.keymap.set('i', '<c-d>', '<c-r>=strftime("%Y-%m-%d")<cr>')

-- Add a Smart TODO comment above current line
vim.keymap.set('n', '<leader>std', 'OTODO(on: date("<c-r>=strftime("%Y-%m-%d")<cr>"), to: "tadas.scerbinskas@shopify.com")<esc>gcco')

-- Markdown shortcuts
vim.keymap.set('n', '<leader>td', 'o<esc>I- [ ]<space>')
vim.keymap.set('n', '<leader>tD', 'O<esc>I- [ ]<space>')
vim.keymap.set('n', '<leader>tt', ':Switch<cr>')
vim.keymap.set('n', '<leader>tN', 'O<esc>I# Next<esc>0j')
vim.keymap.set('n', '<leader>tn', 'o<esc>I# Next<esc>0')
vim.keymap.set('n', '<leader>th', 'o<esc>I# <c-r>=strftime("%Y-%m-%d")<cr>')
vim.keymap.set('n', '<leader>gh', ':e ~/Notes/journal-daily.md<cr>')
vim.keymap.set('n', '<leader>gw', ':e ~/Notes/weeklog.md<cr>')
vim.keymap.set('n', '<leader>gd', ':e ~/Notes/daily/<c-r>=strftime("%Y-%m-%d")<cr>.md<cr>I# <c-r>=strftime("%Y-%m-%d")<cr><cr>')

-- Ruby
vim.keymap.set('n', '<leader>fsl', 'ggO<esc>O# frozen_string_literal: true<esc><c-o>')

-- Plugins
-- ALE mappings
vim.keymap.set('n', ']z', ':ALENextWrap<cr>')
vim.keymap.set('n', '[z', ':ALEPreviousWrap<cr>')
vim.keymap.set('n', 'coa', ':ALEToggle<cr>')
vim.keymap.set('n', '<leader>af', ':ALEFix<cr>')

-- Bring back old vim-unimpaired mapping
vim.keymap.set('n', 'co', 'yo')

-- Aligns ruby 1.9 style hash on ":"
vim.keymap.set('v', '<leader>h', ':Tab/\\w:\\zs/l0l1<cr>')

-- FZF/CtrlSpace
vim.keymap.set('n', '<leader>rt', ':Tags<cr>')
vim.keymap.set('n', '<c-n>', ':CtrlSpace<cr>')
vim.keymap.set('n', '<c-t>', ':Files<cr>')
vim.keymap.set('n', '<c-p>', ':Files<cr>')
vim.keymap.set('n', '<m-h>', ':History<cr>')

-- Search for word under cursor
vim.keymap.set('n', '<leader>sw', ':execute ":Ag " . expand("<cword>")<cr>')
vim.keymap.set('n', '<leader>sW', ':execute ":Ag " . expand("<cWORD>")<cr>')

-- Splitjoin
vim.keymap.set('n', 'sj', ':SplitjoinSplit<cr>')
vim.keymap.set('n', 'sk', ':SplitjoinJoin<cr>')

-- Switch
vim.keymap.set('n', '-', ':Switch<cr>')

-- Fugitive/Git
vim.keymap.set('n', '<leader>gb', ':GBrowse<cr>')
vim.keymap.set('n', 'cog', ':GitGutterToggle<cr>')

-- Vimux
vim.keymap.set('n', 'gh', ':w<cr>:VimuxRunLastCommand<cr>')
vim.keymap.set('n', '<Leader>vp', ':VimuxPromptCommand<cr>')
vim.keymap.set('n', '<Leader>vl', ':VimuxRunLastCommand<cr>')
vim.keymap.set('n', '<Leader>vi', ':VimuxInspectRunner<cr>')
vim.keymap.set('n', '<Leader>vz', ':VimuxZoomRunner<cr>')

-- Rails I18n
vim.keymap.set('n', '<leader>lt', ':call localorie#translate()<cr>', { silent = true })
vim.keymap.set('n', '<leader>le', ':call localorie#expand_key()<cr>', { silent = true })

-- NERDTree
vim.keymap.set('n', '!', ':NERDTreeToggle<cr>')
vim.keymap.set('n', ',m', ':NERDTreeToggle<cr>')
vim.keymap.set('n', '<c-b>', ':NERDTreeToggle<cr>')
vim.keymap.set('n', '`', ':NERDTreeFind<cr>')

-- LazyList
vim.keymap.set('n', 'gll', ':LazyList "- "<cr>')
vim.keymap.set('v', 'gll', ':LazyList "- "<cr>')
vim.keymap.set('n', 'glt', ':LazyList "- [ ] "<cr>')
vim.keymap.set('v', 'glt', ':LazyList "- [ ] "<cr>')

-- Convert GitHub HTTPS to SSH
vim.keymap.set('n', 'gitr', '/https:..github<cr>ctggit@<esc>f/r:B')

-- Generate ctags
vim.keymap.set('n', '<leader>ct', ':!ctags -R .<cr>')

-- Copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', { silent = true, expr = true, script = true })

-- Ag search
vim.keymap.set('n', '<c-g>', ':Ag --ignore "*_test.rb"')

-- Lazy Shift commands (handled via Lua API instead of Vim user commands)
local lazy_commands = {
  {'E', 'e'},
  {'W', 'w'},
  {'Wq', 'wq'},
  {'WQ', 'wq'},
  {'Wa', 'wa'},
  {'WA', 'wa'},
  {'Q', 'q'},
  {'QA', 'qa'},
  {'Qa', 'qa'},
  {'Bd', 'bd'}
}

for _, cmd in ipairs(lazy_commands) do
  vim.api.nvim_create_user_command(cmd[1], function(opts)
    vim.cmd(cmd[2] .. (opts.bang and '!' or '') .. ' ' .. (opts.args or ''))
  end, { bang = true, nargs = '?', complete = 'file' })
end

-- Join lines without surrounding whitespace
-- These commands depend on a function that should be defined in functions.vim
-- We can remap them, but the actual function implementation should be in the functions.lua file
vim.keymap.set('n', 'gJ', ':call JoinWithoutSpaces(0)<cr>')
vim.keymap.set('x', 'gJ', ':<c-u>call JoinWithoutSpaces(1)<cr>')