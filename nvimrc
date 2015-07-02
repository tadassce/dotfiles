" Hello

" Plugins ---------------------------------
filetype off
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

Plugin 'gmarik/Vundle.vim'
Plugin 'floobits/floobits-neovim'

call vundle#end()
filetype plugin indent on
" -----------------------------------------

set rtp+=~/.vim
ru mappings.vim
