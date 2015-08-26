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


  " " Airline
  " "
  " " The first two are for gui hex colors - not used atm
  " "
  " let g:airline#themes#purplebee#palette = {}
  " let s:N1 = [ '' , '' , 255 ,  60 ]
  " let s:N2 = [ '' , '' , 255 , 238 ]
  " let s:N3 = [ '' , '' , 103 , 234 ]
  " let g:airline#themes#purplebee#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  " let g:airline#themes#purplebee#palette.normal_modified = { 'airline_c': [ '' , '' , 3 , 236 , '' ] }
  " let s:I1 = [ '' , '' , 232 ,   4 ]
  " let s:I2 = [ '' , '' , 255 , 238 ]
  " let s:I3 = [ '' , '' , 103 , 234 ]
  " let g:airline#themes#purplebee#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  " let g:airline#themes#purplebee#palette.insert_modified = g:airline#themes#purplebee#palette.normal_modified
  " let g:airline#themes#purplebee#palette.insert_paste = { 'airline_a': [ s:I1[0] , '' , s:I1[2] , 12 , '' ] }
  " let g:airline#themes#purplebee#palette.replace = copy(g:airline#themes#purplebee#palette.insert)
  " let g:airline#themes#purplebee#palette.replace.airline_a = [ s:I2[0] , '' , s:I2[2] , 12 , '' ]
  " let g:airline#themes#purplebee#palette.replace_modified = g:airline#themes#purplebee#palette.normal_modified
  " let s:V1 = [ '' , '' , 232 ,   2 ]
  " let s:V2 = [ '' , '' , 255 , 238 ]
  " let s:V3 = [ '' , '' , 103 , 234 ]
  " let g:airline#themes#purplebee#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  " let g:airline#themes#purplebee#palette.visual_modified = g:airline#themes#purplebee#palette.normal_modified
  " let s:IA1 = [ '' , '' , 239 , 234 ]
  " let s:IA2 = [ '' , '' , 239 , 235 ]
  " let s:IA3 = [ '' , '' , 239 , 236 ]
  " let g:airline#themes#purplebee#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  " let g:airline#themes#purplebee#palette.inactive_modified = g:airline#themes#purplebee#palette.normal_modified
  " let g:airline#themes#purplebee#palette.accents = { 'red': [ '#ff0000' , '' , 1 , '' ] }
  " let g:airline_theme='purplebee'

  " " GitGutter
  " highlight SignColumn ctermbg=234

" -----------------------------------------------------------------------------
elseif $TBG == 'white'
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

  let g:airline#themes#lighttee#palette = {}
  let g:airline#themes#lighttee#palette.normal = airline#themes#generate_color_map(['', '', 15, 239], ['','', 15, 245], ['','', 245, 254])
  let g:airline#themes#lighttee#palette.insert = airline#themes#generate_color_map(['', '', 15,   4], ['','', 15, 245], ['','', 245, 254])
  let g:airline#themes#lighttee#palette.visual = airline#themes#generate_color_map(['', '', 15,   5], ['','', 15, 245], ['','', 245, 254])
  let g:airline_theme='lighttee'

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
