" Hello

" Plugins ---------------------------------
filetype off
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'

" filetypes
Plugin 'vim-ruby/vim-ruby'

call vundle#end()
filetype plugin indent on
" -----------------------------------------

set rtp+=~/.vim
ru mappings.vim
