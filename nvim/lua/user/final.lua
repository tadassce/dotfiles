local theme = require('user.theme')

if theme.background then
  vim.o.background = theme.background
elseif is_dark_mode() then
  vim.o.background = 'dark'
else
  vim.o.background = 'light'
end

vim.cmd('colorscheme ' .. theme.colorscheme)

-- transparent background
if theme.transparent then
  vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
  vim.cmd('hi NonText ctermbg=NONE guibg=NONE')
  vim.cmd('hi LineNr ctermbg=NONE guibg=NONE guifg=1')
end

-- Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 0
