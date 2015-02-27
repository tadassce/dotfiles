" Vim color file - PurpleBee
" orignally BusyBee with quite a bit of changes by @tadassce

set background=dark
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

set t_Co=256
let g:colors_name = "PurpleBee"

" ----------------
" 103 light purple
" 208 orange
" 230 light yellow
" 236 darker grey
" 238 grey
" ----------------

"hi IncSearch -- no settings --
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
hi SpecialComment guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi Typedef        guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi Title          guifg=#f6f3e8 guibg=NONE guisp=NONE gui=bold ctermfg=230 ctermbg=NONE cterm=bold
" hi Folded         guifg=#a0a8b0 guibg=#384048 guisp=#384048 gui=NONE ctermfg=103 ctermbg=238 cterm=NONE
hi Folded         guifg=#a0a8b0 guibg=#384048 guisp=#384048 gui=NONE ctermfg=237 ctermbg=235 cterm=NONE
hi PreCondit      guifg=#faf4c6 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi Include        guifg=#faf4c6 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi Float          guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi StatusLineNC   guifg=#939395 guibg=#303030 guisp=#303030 gui=NONE ctermfg=246 ctermbg=236 cterm=NONE
"hi CTagsMember -- no settings --
hi NonText        guifg=#808080 guibg=#202020 guisp=#202020 gui=NONE ctermfg=8 ctermbg=234 cterm=NONE
"hi CTagsGlobalConstant -- no settings --
"hi ErrorMsg -- no settings --
"hi Ignore -- no settings --
hi Debug          guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi PMenuSbar      guifg=NONE guibg=#202020 guisp=#202020 gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Identifier     guifg=#7281b6 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi SpecialChar    guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi Conditional    guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi StorageClass   guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi Todo           guifg=#8f8f8f guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Special        guifg=#73428f guibg=NONE guisp=NONE gui=NONE ctermfg=96 ctermbg=NONE cterm=NONE
hi LineNr         guifg=#303030 guibg=#202020 guisp=#202020 gui=NONE ctermfg=236 ctermbg=234 cterm=NONE
hi CursorLineNr   guifg=#303030 guibg=#202020 guisp=#202020 gui=NONE ctermfg=240 ctermbg=234 cterm=NONE
hi StatusLine     guifg=#d3d3d5 guibg=#303030 guisp=#303030 gui=NONE ctermfg=188 ctermbg=236 cterm=NONE
hi Normal         guifg=#e2e2e5 guibg=#202020 guisp=#202020 gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi Label          guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
hi PMenuSel       guifg=#000000 guibg=#9cb348 guisp=#9cb348 gui=NONE ctermfg=NONE ctermbg=143 cterm=NONE
hi Search         guibg=#7e8aa2 ctermbg=103
"hi CTagsGlobalVariable -- no settings --
hi Delimiter      guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi Statement      guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
hi Comment        guifg=#3f3f3f guibg=NONE guisp=NONE gui=italic ctermfg=237 ctermbg=NONE cterm=NONE
hi Character      guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
"hi TabLineSel -- no settings --
hi Number         guifg=#5ba66d guibg=NONE guisp=NONE gui=NONE ctermfg=71 ctermbg=NONE cterm=NONE
hi Boolean        guifg=#97a9dd guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Operator       guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi CursorLine     guifg=NONE guibg=#202020 guisp=#202020 gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi Question -- no settings --
"hi WarningMsg -- no settings --
"hi VisualNOS -- no settings --
"hi ModeMsg -- no settings --
hi CursorColumn   guifg=NONE guibg=#202020 guisp=#202020 gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Define         guifg=#faf4c6 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
hi Function       guifg=#97a9dd guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
"hi FoldColumn -- no settings --
hi PreProc        guifg=#faf4c6 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
"hi EnumerationName -- no settings --
hi Visual         guifg=#faf4c6 guibg=#3c414c guisp=#3c414c gui=NONE ctermfg=230 ctermbg=239 cterm=NONE
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
hi VertSplit      guifg=#444444 guibg=#303030 guisp=#303030 gui=NONE ctermfg=238 ctermbg=236 cterm=NONE
hi Exception      guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi Keyword        guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi Type           guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi Cursor         guifg=NONE guibg=#626262 guisp=#626262 gui=NONE ctermfg=NONE ctermbg=241 cterm=NONE
"hi SpellLocal -- no settings --
"hi Error -- no settings --
hi PMenu          guifg=#ffffff guibg=#202020 guisp=#202020 gui=NONE ctermfg=15 ctermbg=234 cterm=NONE
hi SpecialKey     guifg=#808080 guibg=#343434 guisp=#343434 gui=NONE ctermfg=8 ctermbg=236 cterm=NONE
hi Constant       guifg=#3b92ad guibg=NONE guisp=NONE gui=NONE ctermfg=73 ctermbg=NONE cterm=NONE
"hi DefinedName -- no settings --
hi Tag            guifg=#ff9800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi String         guifg=#606060 guibg=NONE guisp=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi PMenuThumb     guifg=NONE guibg=#303030 guisp=#303030 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi MatchParen     guifg=#d0ffc0 guibg=#202020 guisp=#202020 gui=bold ctermfg=193 ctermbg=234 cterm=bold
"hi LocalVariable -- no settings --
hi Repeat         guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
hi Structure      guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi Macro          guifg=#faf4c6 guibg=NONE guisp=NONE gui=NONE ctermfg=230 ctermbg=NONE cterm=NONE
"hi Underlined -- no settings --
"hi TabLine -- no settings --
hi mbenormal                   guifg=#cfbfad guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=187 ctermbg=237 cterm=NONE
hi perlspecialstring           guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi doxygenspecial              guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi pythonimport                guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi mbechanged                  guifg=#eeeeee guibg=#2e2e3f guisp=#2e2e3f gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
hi mbevisiblechanged           guifg=#eeeeee guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=255 ctermbg=60 cterm=NONE
hi doxygenparam                guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi pythonexception             guifg=#f00000 guibg=NONE guisp=NONE gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi pythonbuiltinfunction       guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi pythonoperator              guifg=#7e8aa2 guibg=NONE guisp=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
hi doxygencomment              guifg=#ad7b20 guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi doxygenprev                 guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
hi perlspecialmatch            guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi cformat                     guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi lcursor                     guifg=#404040 guibg=#8fff8b guisp=#8fff8b gui=NONE ctermfg=238 ctermbg=120 cterm=NONE
hi cursorim                    guifg=#404040 guibg=#8b8bff guisp=#8b8bff gui=NONE ctermfg=238 ctermbg=105 cterm=NONE
hi user2                       guifg=#7070a0 guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=103 ctermbg=60 cterm=NONE
hi doxygenspecialmultilinedesc guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi taglisttagname              guifg=#808bed guibg=NONE guisp=NONE gui=NONE ctermfg=105 ctermbg=NONE cterm=NONE
hi doxygenbrief                guifg=#fdab60 guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi pythonexclass               guifg=#009000 guibg=NONE guisp=NONE gui=NONE ctermfg=28 ctermbg=NONE cterm=NONE
hi mbevisiblenormal            guifg=#cfcfcd guibg=#4e4e8f guisp=#4e4e8f gui=NONE ctermfg=252 ctermbg=60 cterm=NONE
hi user1                       guifg=#00ff8b guibg=#3e3e5e guisp=#3e3e5e gui=NONE ctermfg=48 ctermbg=60 cterm=NONE
hi doxygenspecialonelinedesc   guifg=#ad600b guibg=NONE guisp=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
hi cspecialcharacter           guifg=#c080d0 guibg=#404040 guisp=#404040 gui=NONE ctermfg=176 ctermbg=238 cterm=NONE
hi doxygensmallspecial         guifg=#fdd090 guibg=NONE guisp=NONE gui=NONE ctermfg=222 ctermbg=NONE cterm=NONE
"hi clear -- no settings --

hi DiffChange     ctermfg=103 ctermbg=234
hi DiffText       ctermfg=3 ctermbg=234
hi DiffDelete     ctermfg=1 ctermbg=234
hi diffRemoved    ctermfg=1 ctermbg=234
hi gitDiffRemoved ctermfg=1 ctermbg=234
hi DiffAdd        ctermfg=2 ctermbg=234
hi diffAdded      ctermfg=2 ctermbg=234
hi gitDiffAdded   ctermfg=2 ctermbg=234

hi ColorColumn ctermbg=235 guibg=black
hi Directory guifg=#7e8aa2 ctermfg=60

" ----------------------------------------------------------------------------

hi MBENormal              ctermfg=187 ctermbg=237 guifg=#cfbfad guibg=#2e2e3f guisp=#2e2e3f
hi MBEVisibleActiveNormal ctermfg=7 ctermbg=60  guibg=#5f6086
hi MBEVisibleNormal       ctermfg=60  ctermbg=237  guifg=#5f6086 guibg=#2e2e3f guisp=#4e4e8f

hi CtrlSpaceSelected term=reverse ctermfg=60  ctermbg=234 cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=236  cterm=NONE
hi CtrlSpaceFound    ctermfg=220  ctermbg=NONE cterm=bold


" ----------------------------------------------------------------------------
" Airline
"
" The first two are for gui hex colors - not used atm
"
let g:airline#themes#purplebee#palette = {}
let s:N1 = [ '' , '' , 255 ,  60 ]
let s:N2 = [ '' , '' , 255 , 238 ]
let s:N3 = [ '' , '' , 103 , 234 ]
let g:airline#themes#purplebee#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#purplebee#palette.normal_modified = { 'airline_c': [ '' , '' , 3 , 236 , '' ] }
let s:I1 = [ '' , '' , 232 ,   4 ]
let s:I2 = [ '' , '' , 255 , 238 ]
let s:I3 = [ '' , '' , 103 , 234 ]
let g:airline#themes#purplebee#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#purplebee#palette.insert_modified = g:airline#themes#purplebee#palette.normal_modified
let g:airline#themes#purplebee#palette.insert_paste = { 'airline_a': [ s:I1[0] , '' , s:I1[2] , 12 , '' ] }
let g:airline#themes#purplebee#palette.replace = copy(g:airline#themes#purplebee#palette.insert)
let g:airline#themes#purplebee#palette.replace.airline_a = [ s:I2[0] , '' , s:I2[2] , 12 , '' ]
let g:airline#themes#purplebee#palette.replace_modified = g:airline#themes#purplebee#palette.normal_modified
let s:V1 = [ '' , '' , 232 ,   2 ]
let s:V2 = [ '' , '' , 255 , 238 ]
let s:V3 = [ '' , '' , 103 , 234 ]
let g:airline#themes#purplebee#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#purplebee#palette.visual_modified = g:airline#themes#purplebee#palette.normal_modified
let s:IA1 = [ '' , '' , 239 , 234 ]
let s:IA2 = [ '' , '' , 239 , 235 ]
let s:IA3 = [ '' , '' , 239 , 236 ]
let g:airline#themes#purplebee#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#purplebee#palette.inactive_modified = g:airline#themes#purplebee#palette.normal_modified
let g:airline#themes#purplebee#palette.accents = { 'red': [ '#ff0000' , '' , 1 , '' ] }
let g:airline_theme='purplebee'
