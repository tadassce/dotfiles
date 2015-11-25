" My .vimrc File
" Maintained by: Tadas Scerbinskas
" tadas@sce.lt
" http://tadas.me

ru plugins.vim

syntax enable

if $TBG == 'black'
  set background=dark
  " colorscheme purplebee
  " colorscheme code_ts " dark
  " colorscheme tomorrow-night-ts
  " colorscheme tomorrow-night-eighties-ts
  colorscheme purplebee " to load airline purplebee
  " colorscheme pencil
else
  set background=light
  colorscheme pencil
  " colorscheme PaperColor
  " colorscheme tomorrow_ts
  " colorscheme github_ts
endif

" Enable filetypes
filetype on
filetype plugin on
filetype indent on

set colorcolumn=80 " Vertical ruler
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
set smartindent
set autoindent
set undodir=~/.vim/undo
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set autoread
set nowrap
set textwidth=72
set formatoptions-=t " auto-wrap using textwidth
set formatoptions+=r " auto-insert comment leader after enter
set formatoptions+=n " recognize numbered lists
set formatoptions+=1 " don't break a line before a 1-letter word
set formatoptions+=j " remove comment leader when joining lines
set lbr              " Wrap full words
set incsearch
set lazyredraw
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
set laststatus=2 " Always show the status line
set completefunc=syntaxcomplete#Complete
set wildmenu
set wildmode=list:longest,full

" Ignore these files when expanding wildcards
set wildignore+=*.ttf,*.eot,*.svg,*.woff,*.jpg,*.png,*.gif,*.pdf,*.ico
set wildignore+=vendor/*,*/node_modules/*,*/tmp/*
" scala projects:
set wildignore+=*/target/*,*/lib_managed/*,*/project/*

" Invisible characters (not sure about the last two, keeping here for now)
set listchars=tab:→\ ,eol:¬,trail:·,extends:…,precedes:…,nbsp:◦,conceal:☐
set fillchars=stl:\ ,stlnc:-,vert:\|,fold:-,diff:-

ru functions.vim
ru mappings.vim
ru plugin_settings.vim
ru abbreviations.vim
ru color_overrides.vim

autocmd BufWritePre * :call StripTrailingWhitespace()
