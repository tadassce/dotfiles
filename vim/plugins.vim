call plug#begin('~/.vim/plugged')

" filetypes
Plug 'tadassce/vim-ruby', { 'branch': 'no_hanging_indent' }
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'pearofducks/ansible-vim'
" Plug 'lambdatoast/elm.vim'
" Plug 'keith/swift.vim'
" Plug 'posva/vim-vue'
" Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'plasticboy/vim-markdown'
Plug 'parkr/vim-jekyll'

" colors
Plug 'reedes/vim-colors-pencil'
Plug 'jacoborus/tender'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'trevordmiller/nova-vim'

" other visual stuff
Plug 'itchyny/lightline.vim'

" text manipulation
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'

" file search and navigation
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'ivalkeen/nerdtree-execute'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'

" tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'benmills/vimux'
Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-localorie' " Rails I18n
Plug 'bkad/CamelCaseMotion'
Plug 'kana/vim-textobj-user'
Plug 'mbbill/undotree'
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
