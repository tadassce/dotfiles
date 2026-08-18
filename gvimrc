macmenu &File.Print key=<nop>

" remove the scrollbars
set guioptions-=r
set guioptions-=L

set laststatus=1
set linespace=0

set cc=

nmap ,ve :e ~/.gvimrc<cr>
nmap ,vv :so ~/.gvimrc<cr>

" Dark/Light mode
nmap ,bl :set background=light<cr>
nmap ,bd :set background=dark<cr>

" set guifont=JetBrains_Mono_NL:h16
set guifont=iA_Writer_Mono_S:h16

if system("defaults read -g AppleInterfaceStyle 2>/dev/null") =~# "Dark"
  set background=dark
else
  set background=light
endif

colorscheme catppuccin
