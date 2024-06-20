source ~/.config/nvim/plugins.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/colorscheme.vim
source ~/.config/nvim/plugin_settings.vim
source ~/.config/nvim/mappings.vim

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

syntax enable

" au FileType markdown set shiftwidth=4 tabstop=4
