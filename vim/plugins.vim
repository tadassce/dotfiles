call plug#begin('~/.vim/plugged')

" filetypes
Plug 'tadassce/vim-ruby', { 'branch': 'no_hanging_indent' }
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'lambdatoast/elm.vim'
" Plug 'pangloss/vim-javascript'
Plug 'keith/swift.vim'
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'alvan/vim-closetag'

" colors
Plug 'reedes/vim-colors-pencil'
Plug 'jacoborus/tender'
Plug 'trevordmiller/nova-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'

" other visual stuff
Plug 'itchyny/lightline.vim'

" text manipulation
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'

" file search and navigation
Plug 'rking/ag.vim'
" Plug 'scrooloose/nerdtree'
Plug 'AndrewRadev/nerdtree', { 'branch': 'sort-by-atime' }
Plug 'ivalkeen/nerdtree-execute'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'benmills/vimux'

Plug 'airblade/vim-localorie' " Rails I18n
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-user'
Plug 'moll/vim-bbye'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'rizzatti/dash.vim'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()
