-- Load functions module to access is_dark_mode
local functions = require('core.functions')

-- Set default dark theme
vim.opt.background = 'dark'
vim.cmd('colorscheme nord')
vim.cmd('hi link CtrlSpaceSelected Search')
vim.cmd('hi link CtrlSpaceStatus Search')
vim.cmd('hi Visual ctermbg=60 ctermfg=7')

-- Set global variable for lightline theme
vim.g.lightlinetheme = 'nord'

-- Uncomment to automatically switch between dark/light themes based on macOS setting
--[[ 
if functions.is_dark_mode() then
  vim.opt.background = 'dark'
  
  -- Uncomment your preferred dark theme
  -- vim.cmd('colorscheme github')
  -- vim.cmd('colorscheme tokyonight')
  -- vim.cmd('colorscheme tender')
  -- vim.cmd('colorscheme melange')
  -- vim.cmd('colorscheme nightfox')
  -- vim.cmd('colorscheme duskfox')
  -- vim.cmd('colorscheme iceberg')
  -- vim.cmd('colorscheme hybrid')
  -- vim.cmd('colorscheme one')
  -- vim.cmd('colorscheme dawnfox')
  vim.cmd('colorscheme nord')
  
  vim.cmd('hi link CtrlSpaceSelected Search')
  vim.cmd('hi link CtrlSpaceStatus Search')
  vim.cmd('hi Visual ctermbg=60 ctermfg=7')
  
  -- vim.g.lightlinetheme = 'wombat'
  vim.g.lightlinetheme = 'nord'
else
  vim.opt.background = 'light'
  
  -- Uncomment your preferred light theme
  -- vim.cmd('colorscheme pencil')
  -- vim.cmd('colorscheme github')
  vim.cmd('colorscheme iceberg')
  
  vim.g.lightlinetheme = 'Tomorrow'
end
--]]