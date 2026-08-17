if is_dark_mode() then
  vim.o.background = 'dark'
else
  vim.o.background = 'light'
end

vim.cmd('colorscheme iceberg')
-- vim.cmd('colorscheme default')
-- vim.cmd('colorscheme nord')
-- vim.cmd('colorscheme habamax')
-- vim.cmd('colorscheme pencil')
-- vim.cmd('colorscheme gruvbox-material')

-- transparent background
vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi NonText ctermbg=NONE guibg=NONE')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE guifg=1')

-- Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 0
