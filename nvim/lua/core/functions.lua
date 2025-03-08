-- Get alternate file (for Ruby tests)
local function get_alternate()
  -- Strip path and extension from current file
  local fname = vim.fn.expand('%:t:r')

  -- foo.rb => foo_test.rb => foo.rb
  if string.find(fname, '_test') then
    return string.gsub(fname, '_test', '.rb')
  else
    return fname .. '_test.rb'
  end
end

-- FZF commands for alternating between implementation and test files
vim.api.nvim_create_user_command('AA', function()
  vim.fn['fzf#run']({
    options = '--select-1 --query ' .. get_alternate() .. '$',
    sink = 'e'
  })
end, {})

vim.api.nvim_create_user_command('AAH', function()
  vim.fn['fzf#run']({
    options = '--select-1 --query ' .. get_alternate() .. '$',
    sink = 'spl'
  })
end, {})

vim.api.nvim_create_user_command('AAV', function()
  vim.fn['fzf#run']({
    options = '--select-1 --query ' .. get_alternate() .. '$',
    sink = 'vspl'
  })
end, {})

-- Strip trailing whitespace
local function strip_trailing_whitespace()
  -- Preparation: save last search, and cursor position
  local last_search = vim.fn.getreg('/')
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  
  -- Do the business
  vim.cmd([[%s/\s\+$//e]])
  
  -- Clean up: restore previous search history, and cursor position
  vim.fn.setreg('/', last_search)
  vim.fn.cursor(line, col)
end

-- Auto-strip whitespace before save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = strip_trailing_whitespace
})

-- Get macOS theme (dark/light)
function _G.is_dark_mode()
  local theme = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  return theme == "Dark\n"
end

-- Show color codes
local function show_colors()
  local num = 255
  while num >= 0 do
    vim.cmd('hi col_' .. num .. ' ctermbg=' .. num .. ' ctermfg=white')
    vim.cmd('syn match col_' .. num .. ' "ctermbg=' .. num .. ':...." containedIn=ALL')
    vim.fn.append(0, 'ctermbg=' .. num .. ':....')
    num = num - 1
  end
end

vim.api.nvim_create_user_command('ShowColors', show_colors, {})

-- Join lines without surrounding whitespace (used in mappings.lua)
function _G.join_without_spaces(visual)
  if visual == 1 then
    vim.cmd("normal! gvJ")
  else
    vim.cmd("normal! J")
  end
  
  local line = vim.fn.getline('.')
  local pos = vim.fn.col('.')
  
  -- Find joined position (marked by two consecutive spaces)
  local pattern = "  "
  local join_pos = string.find(line, pattern, 1, true)
  
  if join_pos then
    -- Substitute the two spaces with one
    vim.cmd("normal! ^:.,.s/  / /e\<CR>")
    -- Restore cursor position (adjusted for the removed space)
    if pos > join_pos then
      vim.fn.cursor(vim.fn.line('.'), pos - 1)
    else
      vim.fn.cursor(vim.fn.line('.'), pos)
    end
  end
end

-- Make sure Vim can call this function
vim.cmd([[
function! JoinWithoutSpaces(visual)
  lua _G.join_without_spaces(a:visual)
endfunction
]])

-- Export functions that need to be used in other modules
return {
  is_dark_mode = _G.is_dark_mode,
  strip_trailing_whitespace = strip_trailing_whitespace,
  get_alternate = get_alternate,
  show_colors = show_colors,
  join_without_spaces = _G.join_without_spaces
}