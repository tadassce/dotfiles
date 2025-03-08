# Neovim Configuration

This is a Lua-based Neovim configuration.

## Structure

The configuration is organized into the following files:

- `init.lua`: Main configuration file that loads all modules
- `lua/core/plugins.lua`: Plugin management with lazy.nvim
- `lua/core/functions.lua`: Custom functions
- `lua/core/colorscheme.lua`: Theme configuration
- `lua/core/plugin_settings.lua`: Settings for installed plugins
- `lua/core/mappings.lua`: Keyboard mappings

## Migration Notes

This configuration was migrated from a Vim script based setup to Lua. The original Vim script files are still available:

- `init.vim`
- `plugins.vim`
- `functions.vim`
- `colorscheme.vim`
- `plugin_settings.vim`
- `mappings.vim`

## Plugin Manager

The configuration has been updated to use [lazy.nvim](https://github.com/folke/lazy.nvim) instead of vim-plug.

## Usage

1. Make sure you're using Neovim 0.5+ (preferably 0.7+)
2. The first time you run Neovim, lazy.nvim will automatically install itself and all plugins

**Note:** If you encounter any issues with the migration, please refer to the original Vim script files.