-- Plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
return require('lazy').setup({
  -- Navigation
  {
    'junegunn/fzf',
    build = function() vim.fn['fzf#install']() end
  },
  'junegunn/fzf.vim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  'nvim-treesitter/nvim-treesitter-context',
  'preservim/nerdtree',
  'rking/ag.vim',
  'vim-ctrlspace/vim-ctrlspace',

  -- Filetypes
  'jparise/vim-graphql',
  'mtdl9/vim-log-highlighting',
  'plasticboy/vim-markdown',
  'dearrrfish/vim-applescript',

  -- Colorschemes
  'EdenEast/nightfox.nvim',
  'altercation/vim-colors-solarized',
  'arcticicestudio/nord-vim',
  'cocopon/iceberg.vim',
  'cormacrelf/vim-colors-github',
  'folke/tokyonight.nvim',
  'jacoborus/tender.vim',
  'rakr/vim-one',
  'reedes/vim-colors-pencil',
  'savq/melange',
  'w0ng/vim-hybrid',

  -- Extras
  'AndrewRadev/splitjoin.vim',
  'AndrewRadev/switch.vim',
  'KabbAmine/lazyList.vim',
  'airblade/vim-gitgutter',
  'benmills/vimux',
  'godlygeek/tabular',
  'henrik/vim-indexed-search',  -- Show e.g. 'match 1 of 3' in searches.
  'itchyny/lightline.vim',
  'mbbill/undotree',
  'tpope/vim-commentary',
  'tpope/vim-endwise',          -- Add `end`s
  'tpope/vim-fugitive',
  'tpope/vim-jdaddy',           -- JSON formatting
  'tpope/vim-obsession',        -- session management (window positions, open folds)
  'tpope/vim-projectionist',    -- Alternate files
  'tpope/vim-rails',
  'tpope/vim-rake',
  'tpope/vim-repeat',           -- Lets you use '.' to repeat vim-surround commands.
  'tpope/vim-rhubarb',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',       -- Some good mappings with `[`, `]`
  {
    'w0rp/ale',
    cmd = 'ALEToggle'
  },
  'will133/vim-dirdiff',

  -- AI
  'github/copilot.vim',
  -- 'supermaven-inc/supermaven-nvim',

  -- Avante (commented out in original)
  -- Dependencies
  -- 'nvim-treesitter/nvim-treesitter',
  -- 'stevearc/dressing.nvim',
  -- 'nvim-lua/plenary.nvim',
  -- 'MunifTanjim/nui.nvim',
  -- 'MeanderingProgrammer/render-markdown.nvim',
  -- Avante itself
  -- { 'yetone/avante.nvim', branch = 'main', build = 'make' },

  -- Shopify (commented out in original)
  -- 'nvim-lua/plenary.nvim', -- dependency of spin-nvim
  -- 'Shopify/spin-nvim',
})