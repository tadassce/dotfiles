-- Initialize modules
require('core.plugins')
require('core.functions')
require('core.colorscheme')
require('core.plugin_settings')
require('core.mappings')

-- VSCode specific config
if vim.g.vscode then
  vim.keymap.set('n', '<space>', ':', { noremap = true })
else
  vim.keymap.set('n', '<space>', ':', { noremap = true })
end

-- General settings
vim.opt.clipboard = 'unnamedplus'
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.undofile = true
vim.opt.autoread = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.laststatus = 2
vim.opt.showmode = false -- disable -- INSERT -- because that's covered by Lightline
vim.opt.wildmode = 'longest:full,full'
vim.opt.listchars = {
  tab = '→ ',
  eol = '¬',
  trail = '·',
  extends = '…',
  precedes = '…',
  nbsp = '◦',
  conceal = '☐'
}
vim.opt.shortmess:append('I') -- don't show startup message when opening Vim without a file
vim.opt.linebreak = true -- Wrap full words
vim.opt.showbreak = '↪ ' -- keep the space
vim.opt.breakindent = true -- indent the line after a break when wrapping

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Uncomment to set Markdown-specific settings
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.tabstop = 4
--   end
-- })