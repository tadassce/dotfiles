-- Colours per machine, so it is obvious at a glance which one a terminal is
-- on. Neovim detects the terminal's light/dark background through OSC 11,
-- including when connected through SSH and tmux.
--
--   "TS-Mac-mini.local" -> "mini"
--
-- Add a host by adding light and dark entries below; anything unlisted uses
-- Iceberg and lets the terminal background show through.

local M = {}
local host = vim.fn.hostname():gsub('%..*$', ''):gsub('^.*%-', ''):lower()
local applying = false

local hosts = {
  mini = {
    light = {
      colorscheme = 'iceberg',
      lualine = 'iceberg',
      transparent = false,
    },
    dark = {
      colorscheme = 'nord',
      lualine = 'nord',
      transparent = false,
    },
  },
}

local default = {
  colorscheme = 'iceberg',
  lualine = 'iceberg',
  transparent = true,
}

local function terminal_appearance(sequence)
  local r, g, b = sequence:match('^\027%]11;rgba?:(%x+)/(%x+)/(%x+)')
  if not (r and g and b) then return nil end

  local function intensity(component)
    if #component > 4 then return nil end
    return tonumber(component, 16) / tonumber(string.rep('f', #component), 16)
  end

  r, g, b = intensity(r), intensity(g), intensity(b)
  if not (r and g and b) then return nil end
  return 0.299 * r + 0.587 * g + 0.114 * b < 0.5 and 'dark' or 'light'
end

function M.current(appearance)
  local variants = hosts[host]
  return variants and variants[appearance or vim.o.background] or default
end

function M.apply(appearance)
  appearance = appearance or vim.o.background
  local selected = M.current(appearance)

  applying = true
  if vim.o.background ~= appearance then
    vim.o.background = appearance
  end
  vim.cmd('colorscheme ' .. selected.colorscheme)

  if selected.transparent then
    vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
    vim.cmd('hi NonText ctermbg=NONE guibg=NONE')
    vim.cmd('hi LineNr ctermbg=NONE guibg=NONE guifg=1')
  end
  applying = false
end

function M.setup()
  M.apply()

  local group = vim.api.nvim_create_augroup('user_theme', { clear = true })
  vim.api.nvim_create_autocmd('TermResponse', {
    group = group,
    desc = 'Match the colorscheme to the terminal background',
    callback = function(event)
      local appearance = terminal_appearance(event.data.sequence)
      local selected = appearance and M.current(appearance)
      if not selected or applying then return end
      if vim.o.background == appearance and vim.g.colors_name == selected.colorscheme then return end
      vim.schedule(function() M.apply(appearance) end)
    end,
  })
end

return M
