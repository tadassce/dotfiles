macmenu &File.Print key=<nop>
map <D-p> :CommandT<CR>
macmenu Edit.Find.Find\.\.\. key=<nop>
map <D-f> :Ack<space>

" Hide MacVim toolbar by default
set go-=T

" remove the scrollbars
set guioptions-=r
set guioptions-=L

"Grow to maximum horizontal width on entering fullscreen mode
set fuopt+=maxhorz

" Maximize window
nmap ,x :set columns=999 lines=99<CR>

" Move tabs left/right in MacVim
map <s-d-right> :execute "tabmove" tabpagenr()<cr>
map <s-d-left>  :execute "tabmove" tabpagenr() - 2<cr>
