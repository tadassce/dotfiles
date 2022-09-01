call plug#begin()

" navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'rking/ag.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'

" filetypes
Plug 'plasticboy/vim-markdown'
Plug 'mtdl9/vim-log-highlighting'
Plug 'jparise/vim-graphql'

" colorschemes
Plug 'EdenEast/nightfox.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'folke/tokyonight.nvim'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'reedes/vim-colors-pencil'
Plug 'savq/melange'
Plug 'w0ng/vim-hybrid'

" extras
Plug 'AndrewRadev/switch.vim'
Plug 'benmills/vimux'
Plug 'github/copilot.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'              " Add `end`s
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'               " JSON formatting
Plug 'tpope/vim-obsession'            " session management (window positions, open folds)
Plug 'tpope/vim-projectionist'        " Alternate files
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'               " Lets you use '.' to repeat vim-surround commands.
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'           " Some good mappings with `[`, `]`
Plug 'w0rp/ale'
Plug 'KabbAmine/lazyList.vim'

call plug#end()
