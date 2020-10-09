" Vim color file
" Maintainer: Tadas Sce <tadas@sce.lt>

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'pluto'

" Defaults
hi Statement ctermfg=yellow

" hi Normal ctermfg=black ctermbg=white

hi CursorLine cterm=none
hi Search     ctermfg=yellow ctermbg=none cterm=underline,bold
hi Statement  ctermfg=blue

if system("dark-or-light") == "light"
  " hi Statement ctermfg=darkgray
  hi LineNr    ctermfg=253 " light gray
  hi Comment   ctermfg=253 " light gray
  hi VertSplit ctermfg=white ctermbg=white
else
  " hi Statement ctermfg=yellow
  hi LineNr    ctermfg=235 " dark gray
  hi VertSplit ctermfg=black ctermbg=black
endif

" Identifier
" Title
" Label
" Statement
" Operator
" Keyword
" Type

" GitGutter
highlight SignColumn            ctermbg=none ctermfg=241 " mid gray
highlight GitGutterAdd          ctermbg=none ctermfg=green
highlight GitGutterChange       ctermbg=none ctermfg=yellow
highlight GitGutterDelete       ctermbg=none ctermfg=red
highlight GitGutterChangeDelete ctermbg=none ctermfg=yellow
