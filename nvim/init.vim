source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plugin_settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/functions.vim

set clipboard=unnamedplus
set hidden
set noswapfile
set tabstop=2
set shiftwidth=2
set expandtab
set number
set undofile
set autoread
set nowrap
set ignorecase
set hlsearch
set showmatch
set splitbelow
set laststatus=1
set wildmode=longest:full,full
set listchars=tab:→\ ,eol:¬,trail:·,extends:…,precedes:…,nbsp:◦,conceal:☐
set shortmess+=I " don't show startup message when opening Vim without a file
set lbr          " Wrap full words
set showbreak=↪\ " keep the space

" set tags^=./.git/tags;

" set path+=** " search down in subfolders
" set termguicolors
" set notitle
" set smartcase
" set list
" set mouse=a
" set scrolloff=8
" set sidescrolloff=8
" set nojoinspaces
" set splitright
" set confirm
" set exrc
" set backup
" set updatetime=300
" set redrawtime=10000
" set nobackup
" set equalalways
" set statusline=%f " show full filename
" set numberwidth=5

colorscheme slate

syntax enable
