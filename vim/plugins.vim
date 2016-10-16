call plug#begin('~/.vim/plugged')

" filetypes
Plug 'tadassce/vim-ruby', { 'branch': 'no_hanging_indent' }
Plug 'derekwyatt/vim-scala'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'pearofducks/ansible-vim'

" colors
Plug 'reedes/vim-colors-pencil'
Plug 'jacoborus/tender'

" other visual stuff
Plug 'bling/vim-airline'

" text manipulation
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'

" file search and navigation
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'ivalkeen/nerdtree-execute'
Plug 'kien/ctrlp.vim'
Plug 'szw/vim-ctrlspace'

" tools
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-dispatch'
Plug 'diepm/vim-rest-console'

Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-localorie' " Rails I18n
Plug 'tpope/vim-rake'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'moll/vim-bbye'

call plug#end()
