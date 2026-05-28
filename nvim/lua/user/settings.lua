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

vim.opt.foldmethod = "manual"
vim.opt.foldexpr = ""

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
