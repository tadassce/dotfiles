let mapleader = ","

nmap <space> :
imap <tab> <c-n>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nmap K 5k

nmap ,fsl ggO<esc>O# frozen_string_literal: true<esc><c-o>

" Toggle status line
nmap [ts :set laststatus=2<cr>
nmap ]ts :set laststatus=0<cr>

" Join lines without surrounding whitespace
nnoremap gJ :call JoinWithoutSpaces(0)<cr>
xnoremap gJ :<c-u>call JoinWithoutSpaces(1)<cr>

" Add a TODO comment above current line
nmap ,td O<esc>0CTODO <esc>==\\\A

" Notes
nmap ,ntd :e ~/Dropbox/Notes/TODO.txt<CR>
nmap ,ptd :e ~/Dropbox/Notes/picpack-todo.txt<CR>
nmap ,let :cd ~/Library/Mobile\ Documents/7E73H4T2VB~com~x10studio~Letterspace/Documents/Inbox<cr>
nmap ,nia :e ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents/A-temp.md<cr>Go

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nmap - :Switch<cr>

xnoremap <silent> <expr> p Repl()

nnoremap <tab> :NERDTreeToggle<cr>
nnoremap ` :NERDTreeFind<cr>
nnoremap ! :NERDTreeSortByAtimeToggle<cr>

nmap ]w :tabn<cr>
nmap [w :tabp<cr>

" aligns ruby 1.9 style hash on ":"
vmap ,h :Tab/\w:\zs/l0l1<cr>

nmap Q <nop> " Don't go into Ex mode!

" Current date
inoremap <c-d> <C-R>=strftime("%Y-%m-%d")<CR>

nnoremap ,rd :redraw!<cr>
nnoremap <F5> :redraw!<cr>

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

map <leader>v :source ~/.vimrc<cr>

nmap cog :GitGutterToggle<cr>

" A start of a dynamic mapping for running something on the side.
" should be finished with the command and <cr>.
" i.e. rspec spec/models/user_spec.rb<cr>
" nmap ,rs :nmap rs :SlimeSend1

nnoremap gh :w<cr>:VimuxRunLastCommand<cr>
map <Leader>vp :VimuxPromptCommand<cr>
map <Leader>vl :VimuxRunLastCommand<cr>
map <Leader>vi :VimuxInspectRunner<cr>
map <Leader>vz :VimuxZoomRunner<cr>

map ,rs :VroomRunNearestTest<cr>

" Rails I18n
nnoremap <silent> <leader>lt :call localorie#translate()<cr>
nnoremap <silent> <leader>le :call localorie#expand_key()<cr>

" ,w ,b ,e for camelCase motion
call camelcasemotion#CreateMotionMappings('<leader>')

nmap ]a :ALENext<cr>
nmap [a :ALEPrevious<cr>
nmap coa :ALEToggle<cr>
nmap ,af :ALEFix<cr>

nmap <leader>r :Tags<cr>
nmap <c-n> :CtrlSpace<cr>
nmap <c-t> :Files<cr>

nmap ,d :Dash<cr>

" Bring back old vim-unimpaired mapping
nmap co yo
