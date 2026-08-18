-- Colours per machine, so it is obvious at a glance which one a terminal is
-- on. Mirrors the host naming in ~/.dotfiles/prompt and the per-host cases in
-- ~/.dotfiles/herdr/remote-window.
--
--   "TS-Mac-mini.local" -> "mini"
--
-- Add a host by adding an entry below; anything unlisted gets `default`.
--
-- background: omit to follow the system light/dark appearance.
-- transparent: let the terminal background show through instead of the
-- colourscheme's own.
--
-- Other colourschemes installed: default, habamax, pencil, gruvbox-material.

local host = vim.fn.hostname():gsub('%..*$', ''):gsub('^.*%-', ''):lower()

local hosts = {
  mini = {
    colorscheme = 'nord',
    lualine = 'nord',
    background = 'dark',
    transparent = false,
  },
}

local default = {
  colorscheme = 'iceberg',
  lualine = 'iceberg',
  transparent = true,
}

return hosts[host] or default
