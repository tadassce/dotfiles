set nohidden
set noswapfile

" Persistent undo. The mkdir keeps this working on a freshly scp'd box —
" vim silently skips undo files if undodir does not exist.
silent! call mkdir(expand('~/.vim/undo'), 'p')
set undodir=~/.vim/undo
set undofile

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set nowrap
set textwidth=72
set formatoptions=qrn1j
set hlsearch
set ignorecase
set wildmenu
set wildmode=list:longest,full
set showcmd
set splitbelow
nmap <space> :
