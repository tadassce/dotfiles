macmenu &File.Print key=<nop>

" remove the scrollbars
set guioptions-=r
set guioptions-=L

set laststatus=1
set linespace=0

set cc=

" Maximize window
nmap ,x :set columns=999 lines=99<CR>

" Make the window 80 col (+4 for line numbers)
nmap ,e :set columns=84<cr>

" Dark/Light mode
nmap ,bl :set background=light<cr>
nmap ,bd :set background=dark<cr>

" set guifont=Operator:h13
" set guifont=espresso_mono:h13
" set guifont=menlo:h15
" set guifont=monaco:h13
" set guifont=source_code_pro:h14
" set guifont=SF_Mono:h18
" set guifont=JetBrains_Mono_NL:h18
set guifont=iA_Writer_Mono_S:h18

" colorscheme purplebee
" colorscheme dusk
colorscheme pencil
" colorscheme nova
