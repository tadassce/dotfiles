let mapleader = ","

imap <tab> <c-n>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" open or create files
map gF :edit <cfile><cr>

nmap <leader>ve :e ~/.config/nvim/init.vim<cr>
nmap <leader>vv :source ~/.config/nvim/init.vim<cr>

" Remap number increment
nmap <c-s> <c-a>

" Toggle status line
nmap [ts :set laststatus=2<cr>
nmap ]ts :set laststatus=0<cr>

nmap Q <nop> " Don't go into Ex mode!

" Lazy shift
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang Bd bd<bang>
endif

nmap ]w :tabn<cr>
nmap [w :tabp<cr>

" Copy current filename to clipboard
nmap cp :let @+ = expand("%")<CR>

" Format XML
nmap <leader>x :%!xmllint --format -<cr>

" Quicklook
nmap <leader>ql :!qlmanage -p %<cr>

" Open with default app
nmap <leader>xx :!open %<cr>

" Open word/URL under cursor in a browser
nmap <leader>xo :!open <cWORD><cr>

" Open with iA Writer
nmap <leader>ia :!open % -a "iA Writer"<cr>

" Notes
nmap <leader>nn :cd ~/Notes<cr>
nmap <leader>nj :cd ~/Notes<cr>:e journal.md<cr>Go# <c-d><cr>-<space>


" -- Insert / Snippets --------------------------

" Current date
inoremap <c-d> <c-r>=strftime("%Y-%m-%d")<cr>

" Add a [Smart TODO](https://github.com/Shopify/smart_todo) comment above current line
nmap <leader>std OTODO(on: date('<c-r>=strftime("%Y-%m-%d")<cr>'), to: 'tadas.scerbinskas@shopify.com')<esc>gcco

" Markdown shortcuts
nmap <leader>td o<esc>I- [ ]<space>
nmap <leader>tD O<esc>I- [ ]<space>
nmap <leader>tt o<esc>I- <space>
nmap <leader>th o<esc>I# <c-r>=strftime("%Y-%m-%d")<cr>

" Ruby
nmap <leader>fsl ggO<esc>O# frozen_string_literal: true<esc><c-o>
inoremap <c-e> <%=  %><esc>hhi


" -- Plugins ------------------------------------

" Join lines without surrounding whitespace
nnoremap gJ :call JoinWithoutSpaces(0)<cr>
xnoremap gJ :<c-u>call JoinWithoutSpaces(1)<cr>

nmap ]z :ALENextWrap<cr>
nmap [z :ALEPreviousWrap<cr>
nmap coa :ALEToggle<cr>
nmap <leader>af :ALEFix<cr>

" Bring back old vim-unimpaired mapping
nmap co yo

" aligns ruby 1.9 style hash on ":"
vmap <leader>h :Tab/\w:\zs/l0l1<cr>

nmap <leader>rt :Tags<cr>
nmap <c-n> :CtrlSpace<cr>
nmap <c-t> :Files<cr>
nmap <c-p> :Files<cr>
nmap <m-h> :History<cr>

" Search for word under cursor
nnoremap <leader>sw :execute ":Ag " . expand("<cword>")<cr>
nnoremap <leader>sW :execute ":Ag " . expand("<cWORD>")<cr>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nmap - :Switch<cr>

nmap cog :GitGutterToggle<cr>

nnoremap gh :w<cr>:VimuxRunLastCommand<cr>
map <Leader>vp :VimuxPromptCommand<cr>
map <Leader>vl :VimuxRunLastCommand<cr>
map <Leader>vi :VimuxInspectRunner<cr>
map <Leader>vz :VimuxZoomRunner<cr>

" Rails I18n
nnoremap <silent> <leader>lt :call localorie#translate()<cr>
nnoremap <silent> <leader>le :call localorie#expand_key()<cr>

nmap ! :NERDTreeToggle<cr>
nmap ,m :NERDTreeToggle<cr>
nmap <c-b> :NERDTreeToggle<cr>
nnoremap ` :NERDTreeFind<cr>
" nnoremap !~ :NERDTreeSortByAtimeToggle<cr>

nnoremap gll :LazyList '- '<cr>
vnoremap gll :LazyList '- '<cr>
nnoremap glt :LazyList '- [ ] '<cr>
vnoremap glt :LazyList '- [ ] '<cr>
