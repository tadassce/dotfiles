let mapleader = ","

nmap <space> :
imap <tab> <c-n>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap K 5k

" Join lines without surrounding whitespace
nnoremap gJ :call JoinWithoutSpaces(0)<cr>
xnoremap gJ :<c-u>call JoinWithoutSpaces(1)<cr>

" Add a TODO comment above current line
nmap ,td O<esc>0CTODO <esc>==\\\A

" Notes
nmap ,ntd :e ~/Dropbox/Notes/TODO.txt<CR>
nmap ,ptd :e ~/Dropbox/Notes/picpack-todo.txt<CR>
nmap ,dtd :e ~/Dropbox/Notes/dawanda-todo.txt<CR>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nmap - :Switch<cr>

xnoremap <silent> <expr> p Repl()

map <tab> :NERDTreeToggle<cr>
nnoremap ` :NERDTreeFind<cr>

nmap ]w :tabn<cr>
nmap [w :tabp<cr>

" aligns ruby 1.9 style hash on ":"
vmap ,h :Tab/\w:\zs/l0l1<cr>

nmap Q <nop> " Don't go into Ex mode!

" Current date
inoremap <c-d> <C-R>=strftime("%Y-%m-%d")<CR>

nnoremap <F9> :Dispatch<CR>

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

nmap ,s :SlimeSend1 rspec<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
