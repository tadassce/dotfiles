" My .vimrc File
" Maintained by: Tadas Scerbinskas
" tadas@sce.lt
" https://tadas.me

ru plugins.vim

syntax enable

colorscheme default

" Enable filetypes
filetype on
filetype plugin on
filetype indent on

" set colorcolumn=80,100 " Vertical ruler
set vb " disable beep
set clipboard=unnamed
set ffs=unix
set nocompatible
set backspace=indent,eol,start " Make backspace work properly
set enc=utf-8
set autowrite     " Write the file out when switching between files.
set ruler         " Display current cursor position in lower right corner.
set hidden        " Ok to keep empty buffers
set noswapfile
set tabstop=2     " Number of space chars that will be inserted when the tab key is pressed
set shiftwidth=2  " Number of space characters inserted for indentation
set softtabstop=2 " Makes the spaces feel like real tabs
set expandtab     " To insert space characters whenever the tab key is pressed
set smarttab
set number          " Show line numbers. Or not.
set nocursorline    " Don't highlight the current line
set smartindent
set autoindent
set breakindent     " respect indentation when wrapping lines
set undodir=~/.vim/undo
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set autoread
set nowrap
set textwidth=80
set formatoptions-=t " auto-wrap using textwidth
set formatoptions+=r " auto-insert comment leader after enter
set formatoptions+=n " recognize numbered lists
set formatoptions+=1 " don't break a line before a 1-letter word
set formatoptions+=j " remove comment leader when joining lines
set lbr              " Wrap full words
set sidescroll=1     " Scroll horizontally by 1 char (default 0 scrolls by half screen)
set incsearch
" set lazyredraw
set hlsearch
set ignorecase
set mousehide
set ttyfast
set showcmd
set showmatch
set shortmess+=I " don't show startup message when opening Vim without a file
set splitbelow
set showbreak=↪\ " keep the space
set spelllang=en_us
set complete+=kspell
set wmw=0 " Minimum window height, to save space
" set laststatus=0 " Don't show the status line
set laststatus=1 " Show the status line if there are multiple windows
set completefunc=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full
set maxmempattern=1000000 " default is 1000

" Ignore these files when expanding wildcards
set wildignore+=*.ttf,*.eot,*.svg,*.woff,*.jpg,*.png,*.gif,*.pdf,*.ico
set wildignore+=vendor/*,*/node_modules/*,*/tmp/*
" scala projects:
set wildignore+=*/target/*,*/lib_managed/*,*/project/*

" Invisible characters (not sure about the last two, keeping here for now)
set listchars=tab:→\ ,eol:¬,trail:·,extends:…,precedes:…,nbsp:◦,conceal:☐
set fillchars=stl:\ ,stlnc:-,vert:\|,fold:-,diff:-

" To fix Dispatch - https://github.com/tpope/vim-dispatch/issues/192
set shellpipe+=\ " with trailing whitespace

set tags^=./.git/tags;

ru functions.vim
ru mappings.vim
ru plugin_settings.vim
ru private_settings.vim
ru abbreviations.vim

silent! so .vimlocal

autocmd BufWritePre * :call StripTrailingWhitespace()
