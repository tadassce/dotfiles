local keymap = vim.keymap

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap('<space>', ':')

-- Window navigation
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-h>', '<C-w>h')
nmap('<C-l>', '<C-w>l')

keymap.set('i', 'jj', '<esc>:w<CR>', { desc = "Exit insert mode and save" })
keymap.set('t', 'jj', '<C-\\><C-n>', { desc = "Exit terminal mode" })

-- Navigate windows from terminal mode with Ctrl+hjkl
keymap.set('t', '<C-h>', '<Cmd>wincmd h<CR>', { desc = "Go to left window" })
keymap.set('t', '<C-j>', '<Cmd>wincmd j<CR>', { desc = "Go to down window" })
keymap.set('t', '<C-k>', '<Cmd>wincmd k<CR>', { desc = "Go to up window" })
keymap.set('t', '<C-l>', '<Cmd>wincmd l<CR>', { desc = "Go to right window" })
keymap.set('n', '<leader>vt', ':vert terminal<CR>', { silent = true, desc = "Open terminal in vertical split" })

-- Open or create files
nmap('gF', ':edit <cfile><cr>')

-- Config editing shortcuts
nmap('<leader>ve', ':e ~/.config/nvim/init.lua<cr>')
nmap('<leader>vv', ':source ~/.config/nvim/init.lua<cr>')

-- Remap number increment
nmap('<c-s>', '<c-a>')

-- Toggle status line
nmap('[ts', ':set laststatus=2<cr>')
nmap(']ts', ':set laststatus=0<cr>')

-- Disable Ex mode
nmap('Q', '<nop>')

-- Tab navigation
nmap(']w', ':tabn<cr>')
nmap('[w', ':tabp<cr>')

-- Copy current filename to clipboard
nmap('cp', ':let @+ = expand("%")<CR>')

-- Format XML
nmap('<leader>x', ':%!xmllint --format -<cr>')

-- Quicklook
nmap('<leader>ql', ':!qlmanage -p %<cr>')

-- Open with default app
nmap('<leader>xx', ':!open %<cr>')

-- Open word/URL under cursor in a browser
nmap('<leader>xo', ':!open <cWORD><cr>')

-- gx to open URL/file under cursor (replaces netrw's gx and vim-markdown's gx)
local function open_under_cursor()
  local word = vim.fn.expand('<cfile>')
  vim.ui.open(word)
end

local function open_markdown_link()
  local syn = vim.fn.synIDattr(vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1), 'name')
  -- Check if cursor is on a markdown link element
  if syn:match('^mkd') then
    -- Extract URL from markdown link: [text](url) or <url>
    local line = vim.fn.getline('.')
    local col = vim.fn.col('.')
    -- Try to find URL in parentheses [text](url)
    local url = line:match('%]%(([^)]+)%)')
    -- Try angle bracket URL <url>
    if not url then
      url = line:match('<(https?://[^>]+)>')
    end
    -- Try bare URL
    if not url then
      url = line:match('(https?://[%w%%/_#%.%-]+)')
    end
    if url then
      -- Handle relative paths
      if not url:match('^https?://') then
        url = vim.fn.expand('%:h') .. '/' .. url
      end
      vim.ui.open(url)
      return
    end
  end
  -- Fallback to <cfile>
  open_under_cursor()
end

vim.keymap.set('n', 'gx', open_under_cursor, { desc = 'Open file/URL under cursor' })

-- Override vim-markdown's gx mapping for markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', 'gx', open_markdown_link, { buffer = true, desc = 'Open markdown link under cursor' })
  end,
})

-- Open with iA Writer
nmap('<leader>ia', ':!open "%" -a "iA Writer"<cr>')

-- Notes
nmap('<leader>nn', ':cd ~/Notes<cr>')
nmap('<leader>nj', ':cd ~/Notes<cr>:e journal.md<cr>Go# <c-d><cr>-<space>')

-- Insert / Snippets
-- Current date
imap('<c-d>', '<c-r>=strftime("%Y-%m-%d")<cr>')

-- Add a Smart TODO comment above current line
nmap('<leader>std', 'OTODO(on: date("<c-r>=strftime("%Y-%m-%d")<cr>"), to: "tadas.scerbinskas@shopify.com")<esc>gcco')

nmap('<leader>cp', ':colorscheme pencil<cr>')

-- Markdown shortcuts
nmap('<leader>td', 'o<esc>I- [ ]<space>')
nmap('<leader>tD', 'O<esc>I- [ ]<space>')
nmap('<leader>tt', ':Switch<cr>')
nmap('<leader>tN', 'O<esc>I# Next<esc>0j')
nmap('<leader>tn', 'o<esc>I# Next<esc>0')
nmap('<leader>th', 'o<esc>I# <c-r>=strftime("%Y-%m-%d")<cr>')
nmap('<leader>gh', ':e ~/Notes/journal-daily.md<cr>')
nmap('<leader>gw', ':e ~/Notes/weeklog.md<cr>')
nmap('<leader>gd', ':e ~/Notes/daily/<c-r>=strftime("%Y-%m-%d")<cr>.md<cr>I# <c-r>=strftime("%Y-%m-%d")<cr><cr>')
nmap('<leader>tf', ':TableFormat<cr>')

-- Wrap selection (visual) or word under cursor (normal) in a wiki-link [[...]]
-- In normal mode "-" counts as part of the word (e.g. my-page-name).
vim.keymap.set('n', '<leader>w', _G.wrap_wikilink_word, { silent = true, desc = 'Wrap word under cursor in [[wiki-link]]' })
vim.keymap.set('x', '<leader>w', 'c[[<C-r><C-o>"]]<Esc>', { silent = true, desc = 'Wrap selection in [[wiki-link]]' })

-- Ruby
nmap('<leader>fsl', 'ggO<esc>O# frozen_string_literal: true<esc><c-o>')

-- Plugins
-- ALE mappings
nmap(']z', ':ALENextWrap<cr>')
nmap('[z', ':ALEPreviousWrap<cr>')
nmap('yoa', ':ALEToggle<cr>')
nmap('<leader>af', ':ALEFix<cr>')

-- Aligns ruby 1.9 style hash on ":"
vim.keymap.set('v', '<leader>h', ':Tab/\\w:\\zs/l0l1<cr>')

-- FZF/CtrlSpace
nmap('<leader>c', ':Colors<cr>')
nmap('<leader>rt', ':Tags<cr>')
nmap('<c-n>', ':CtrlSpace<cr>')
nmap('<c-t>', ':Files<cr>')
nmap('<c-p>', ':Files<cr>')
nmap('<m-h>', ':History<cr>')

-- Search for word under cursor
nmap('<leader>sw', ':execute ":Ag " . expand("<cword>")<cr>')
nmap('<leader>sW', ':execute ":Ag " . expand("<cWORD>")<cr>')

-- Splitjoin
nmap('sj', ':SplitjoinSplit<cr>')
nmap('sk', ':SplitjoinJoin<cr>')

-- Switch
nmap('-', ':Switch<cr>')

-- llm text cleanup
nmap('<leader>em', ":%s/—/-/ge<cr>:%s/[’“”]/'/ge<cr>:%s/;/,/ge<cr>")

-- Fugitive/Git
nmap('<leader>gb', ':GBrowse<cr>')
nmap('yog', ':GitGutterToggle<cr>')

-- Vimux
nmap('gh', ':w<cr>:VimuxRunLastCommand<cr>')
nmap('<Leader>vp', ':VimuxPromptCommand<cr>')
nmap('<Leader>vl', ':VimuxRunLastCommand<cr>')
nmap('<Leader>vi', ':VimuxInspectRunner<cr>')
nmap('<Leader>vz', ':VimuxZoomRunner<cr>')

-- Rails I18n
nmap('<leader>lt', ':call localorie#translate()<cr>', { silent = true })
nmap('<leader>le', ':call localorie#expand_key()<cr>', { silent = true })

-- NERDTree
nmap('!', ':NERDTreeToggle<cr>')
nmap(',m', ':NERDTreeToggle<cr>')
nmap('<c-b>', ':NERDTreeToggle<cr>')
nmap('`', ':NERDTreeFind<cr>')

-- LazyList
nmap('gll', ':LazyList "- "<cr>')
vim.keymap.set('v', 'gll', ':LazyList "- "<cr>')
nmap('glt', ':LazyList "- [ ] "<cr>')
vim.keymap.set('v', 'glt', ':LazyList "- [ ] "<cr>')

-- Convert GitHub HTTPS to SSH
nmap('gitr', '/https:..github<cr>ctggit@<esc>f/r:B')

-- Generate ctags
nmap('<leader>ct', ':!ctags -R .<cr>')

-- Ag search
nmap('<c-g>', ':Ag --ignore "*_test.rb"')

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
nmap('gJ', ':call JoinWithoutSpaces(0)<cr>')
map('x', 'gJ', ':<c-u>call JoinWithoutSpaces(1)<cr>')

if vim.g.vscode then
  -- jump around VSCode splits
  local opts = { noremap = true, silent = true }

  map("", "<C-h>", '<Cmd>lua WinMove("Left")<CR>', opts)
  map("", "<C-j>", '<Cmd>lua WinMove("Down")<CR>', opts)
  map("", "<C-k>", '<Cmd>lua WinMove("Up")<CR>', opts)
  map("", "<C-l>", '<Cmd>lua WinMove("Right")<CR>', opts)

  function WinMove(direction)
    vim.fn.VSCodeCall("workbench.action.focus" .. direction .. "Group")
  end
end
