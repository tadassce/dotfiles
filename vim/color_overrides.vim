if $TBG == 'black'
  " hi DiffChange     ctermfg=103 ctermbg=234
  " hi DiffText       ctermfg=3 ctermbg=234
  " hi DiffDelete     ctermfg=1 ctermbg=234
  " hi diffRemoved    ctermfg=1 ctermbg=234
  " hi gitDiffRemoved ctermfg=1 ctermbg=234
  " hi DiffAdd        ctermfg=2 ctermbg=234
  " hi diffAdded      ctermfg=2 ctermbg=234
  " hi gitDiffAdded   ctermfg=2 ctermbg=234

  " hi ColorColumn ctermbg=235 guibg=black
  " hi Directory guifg=#7e8aa2 ctermfg=60

  " hi MBENormal              ctermfg=187 ctermbg=237 guifg=#cfbfad guibg=#2e2e3f guisp=#2e2e3f
  " hi MBEVisibleActiveNormal ctermfg=7 ctermbg=60  guibg=#5f6086
  " hi MBEVisibleNormal       ctermfg=60  ctermbg=237  guifg=#5f6086 guibg=#2e2e3f guisp=#4e4e8f

  " hi CtrlSpaceSelected term=reverse ctermfg=60  ctermbg=234 cterm=bold
  " hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=236  cterm=NONE
  " hi CtrlSpaceFound    ctermfg=220  ctermbg=NONE cterm=bold

  " " GitGutter
  " highlight SignColumn ctermbg=234

" -----------------------------------------------------------------------------
elseif $TBG == 'white'
  hi Search ctermbg=NONE cterm=underline,bold

  " " diffs
  " hi DiffText       ctermfg=3   ctermbg=255
  " hi DiffChange     ctermfg=255 ctermbg=3
  " hi DiffDelete     ctermfg=255 ctermbg=1
  " hi diffRemoved    ctermfg=255 ctermbg=1
  " hi gitDiffRemoved ctermfg=255 ctermbg=1
  " hi DiffAdd        ctermfg=255 ctermbg=2
  " hi diffAdded      ctermfg=255 ctermbg=2
  " hi gitDiffAdded   ctermfg=255 ctermbg=2

  " hi LineNr    ctermfg=252
  " hi Folded    ctermfg=248 ctermbg=NONE
  " hi VertSplit ctermfg=255 ctermbg=254

  " GitGutter
  highlight SignColumn            ctermbg=254 ctermfg=241
  highlight GitGutterAdd          ctermbg=254 ctermfg=2
  highlight GitGutterChange       ctermbg=254 ctermfg=3
  highlight GitGutterDelete       ctermbg=254 ctermfg=1
  highlight GitGutterChangeDelete ctermbg=254 ctermfg=3

" -----------------------------------------------------------------------------
endif

hi diffAdded      ctermfg=2
hi diffRemoved    ctermfg=1

" hi DiffAdd        ctermfg=2
" hi DiffDelete     ctermfg=1
"
" hi gitDiffAdded   ctermfg=2
" hi gitDiffRemoved ctermfg=1
"
" hi DiffText       ctermfg=3
" hi DiffChange     ctermfg=3
