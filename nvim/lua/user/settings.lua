local o = vim.opt
local g = vim.g

g.mapleader = ','

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

g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

-- Plain p stays local: Rex can forward OSC 52 writes without answering reads.
o.clipboard = ''
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('user_clipboard', { clear = true }),
  callback = function()
    local yank = vim.v.event
    if yank.operator == 'y' and yank.regname == '' then
      vim.fn.setreg('+', yank.regcontents, yank.regtype)
    end
  end,
})
