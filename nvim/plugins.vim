call plug#begin()

" navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'rking/ag.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'

" colorschemes
Plug 'EdenEast/nightfox.nvim'

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

call plug#end()
