source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plugin_settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/functions.vim

if exists('g:vscode')
  " VSCode extension
  nmap <space> :
else
  nmap <space> :
endif

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
set laststatus=2
set noshowmode " disable -- INSERT -- because that's covered by Lightline
set wildmode=longest:full,full
set listchars=tab:→\ ,eol:¬,trail:·,extends:…,precedes:…,nbsp:◦,conceal:☐
set shortmess+=I " don't show startup message when opening Vim without a file
set lbr          " Wrap full words
set showbreak=↪\ " keep the space
set breakindent " indent the line after a break when wrapping

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

if system("dark-or-light") == "light"
  colorscheme dawnfox
else
  colorscheme nightfox
endif

" colorscheme github
" colorscheme tokyonight
" colorscheme tender
" colorscheme melange
" colorscheme nightfox
" colorscheme duskfox
" colorscheme iceberg
" colorscheme hybrid
" colorscheme one
" colorscheme nord
colorscheme pencil

hi Search ctermbg=NONE cterm=underline,bold

syntax enable

au FileType markdown set shiftwidth=4 tabstop=4
