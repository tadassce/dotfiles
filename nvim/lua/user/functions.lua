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
  group = vim.api.nvim_create_augroup('user_functions', { clear = true }),
  pattern = '*',
  callback = strip_trailing_whitespace
})

-- Get macOS theme (dark/light)
function _G.is_dark_mode()
  local theme = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
  return theme == "Dark\n"
end

-- Convert an xterm-256 color index to RGB for 'termguicolors'.
local function xterm_color(index)
  local base_colors = {
    '#000000', '#800000', '#008000', '#808000',
    '#000080', '#800080', '#008080', '#c0c0c0',
    '#808080', '#ff0000', '#00ff00', '#ffff00',
    '#0000ff', '#ff00ff', '#00ffff', '#ffffff',
  }

  if index < 16 then
    return base_colors[index + 1]
  end

  if index < 232 then
    local levels = { 0, 95, 135, 175, 215, 255 }
    local color = index - 16
    local red = levels[math.floor(color / 36) + 1]
    local green = levels[math.floor(color / 6) % 6 + 1]
    local blue = levels[color % 6 + 1]
    return string.format('#%02x%02x%02x', red, green, blue)
  end

  local gray = 8 + (index - 232) * 10
  return string.format('#%02x%02x%02x', gray, gray, gray)
end

-- Show color codes
local function show_colors()
  local num = 255
  while num >= 0 do
    vim.api.nvim_set_hl(0, 'col_' .. num, {
      bg = xterm_color(num),
      fg = '#ffffff',
      ctermbg = num,
      ctermfg = 15,
    })
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
    vim.cmd([[normal! ^:.,.s/  / /e<CR>]])
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

-- Wrap the word under the cursor in a wiki-link ([[...]]).
-- Hyphens ("-") are treated as part of the word, e.g. "my-page-name".
function _G.wrap_wikilink_word()
  local line = vim.fn.getline('.')
  local col = vim.fn.col('.') -- 1-indexed byte column of the cursor

  local function is_word(c)
    return c ~= '' and c:match('[%w_-]') ~= nil
  end

  -- Nothing useful under the cursor (whitespace/punctuation) -> bail.
  if not is_word(line:sub(col, col)) then
    return
  end

  -- Expand left and right to the word boundaries.
  local s = col
  while s > 1 and is_word(line:sub(s - 1, s - 1)) do
    s = s - 1
  end
  local e = col
  while e < #line and is_word(line:sub(e + 1, e + 1)) do
    e = e + 1
  end

  local word = line:sub(s, e)
  local new_line = line:sub(1, s - 1) .. '[[' .. word .. ']]' .. line:sub(e + 1)
  vim.fn.setline('.', new_line)
  -- Keep the cursor on the same character (shifted right by the opening "[[").
  vim.fn.cursor(vim.fn.line('.'), col + 2)
end

-- Reload the config (<leader>vv)
-- Sourcing init.lua alone does nothing, because `require` caches modules. So drop
-- the cached user modules first, then re-source init.lua to require them again.
-- 'user.plugins' is deliberately kept cached: re-running lazy.setup() is not safe.
local function reload_config()
  for name, _ in pairs(package.loaded) do
    if name:match('^user%.') and name ~= 'user.plugins' then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify('Config reloaded')
end

vim.api.nvim_create_user_command('ReloadConfig', reload_config, { desc = 'Reload nvim config' })

-- Export functions that need to be used in other modules
return {
  is_dark_mode = _G.is_dark_mode,
  strip_trailing_whitespace = strip_trailing_whitespace,
  get_alternate = get_alternate,
  show_colors = show_colors,
  join_without_spaces = _G.join_without_spaces,
  wrap_wikilink_word = _G.wrap_wikilink_word
}