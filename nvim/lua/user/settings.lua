local o = vim.opt
local g = vim.g

g.mapleader = ','

o.clipboard = 'unnamedplus'
o.hidden = true
o.swapfile = false
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.number = true
o.undofile = true
o.autoread = true
o.wrap = false
o.ignorecase = true
o.hlsearch = true
o.showmatch = true
o.splitbelow = true
o.laststatus = 2
o.showmode = true
o.wildmode = 'longest:full,full'
o.shortmess:append('I') -- don't show startup message when opening Vim without a file
o.linebreak = true -- Wrap full words
o.showbreak = '↪ ' -- keep the space
o.breakindent = true -- indent the line after a break when wrapping

o.listchars = {
  tab = '→ ',
  eol = '¬',
  trail = '·',
  extends = '…',
  precedes = '…',
  nbsp = '◦',
  conceal = '☐'
}

vim.cmd('syntax enable')
-- vim.cmd('colorscheme nord')
-- vim.cmd('hi link CtrlSpaceSelected Search')
-- vim.cmd('hi link CtrlSpaceStatus Search')
-- vim.cmd('hi Visual ctermbg=60 ctermfg=7')

-- Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 0
