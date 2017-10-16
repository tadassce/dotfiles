macmenu &File.Print key=<nop>
map <D-p> :CommandT<CR>
macmenu Edit.Find.Find\.\.\. key=<nop>
map <D-f> /
map <D-F> :Ag<space>

" Hide MacVim toolbar by default
set go-=T

" remove the scrollbars
set guioptions-=r
set guioptions-=L

"Grow to maximum horizontal width on entering fullscreen mode
set fuopt+=maxhorz

set laststatus=1
set linespace=0

set cc=

" Maximize window
nmap ,x :set columns=999 lines=99<CR>

" Make the window 80 col (+4 for line numbers)
nmap ,e :set columns=84<cr>

" Move tabs left/right in MacVim
map <s-d-right> :execute "tabmove" tabpagenr()<cr>
map <s-d-left>  :execute "tabmove" tabpagenr() - 2<cr>

" set guifont=Meslo_LG_M_DZ_Regular_for_Powerline:h14
" set guifont=Operator:h13
" set guifont=consolas_for_powerline:h14
" set guifont=droid_sans_mono_for_powerline:h14
" set guifont=espresso_mono:h13
" set guifont=espresso_mono_for_powerline:h13
" set guifont=menlo:h13
" set guifont=menlo_for_powerline:h13
" set guifont=monaco:h13
" set guifont=monaco_for_powerline:h13
" set guifont=source_code_pro:h14
" set guifont=SF_Mono:h15

" colorscheme purplebee
" colorscheme dusk
" colorscheme pencil
colorscheme nova
