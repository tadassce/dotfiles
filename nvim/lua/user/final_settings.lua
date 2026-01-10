vim.opt.foldmethod = "manual"
vim.opt.foldexpr = ""

if is_dark_mode() then
  vim.cmd('set background=dark')
else
  vim.cmd('set background=light')
end
vim.cmd('colorscheme iceberg')

-- vim.cmd('colorscheme nord')
-- vim.cmd('hi link CtrlSpaceSelected Search')
-- vim.cmd('hi link CtrlSpaceStatus Search')
-- vim.cmd('hi Visual ctermbg=60 ctermfg=7')
