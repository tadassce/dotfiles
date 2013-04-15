"
" My .vimrc File
" Maintained by: Tadas Scerbinskas
" tadas@sce.lt
" http://tadas.me
"

call pathogen#infect()
call pathogen#helptags()

" if you want vim to overrule your settings, use:
" syntax on
" otherwise:
syntax enable

" The ones that are suffixed by 'ts' are my forks..
colorscheme busybee_ts
" colorscheme github_ts " light
" colorscheme code_ts " dark
" colorscheme tomorrow-night-ts
" colorscheme tomorrow-night-eighties-ts
" colorscheme grb256_ts

" set guifont=monaco:h14
" set guifont=menlo:h14
set guifont=espresso_mono:h13
set guifont=espresso_mono_for_powerline:h13

" let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'

" line height
set linespace=0

" colorcolumn for short, adds a vertical ruler
set cc=80
" hi ColorColumn ctermbg=255 guibg=white
hi ColorColumn ctermbg=235 guibg=black

" disable beep (e.g. when hitting Esc in normal mode)
set vb

set clipboard=unnamed

" set ffs=unix,dos
set ffs=unix

" Cursor
" highlight Cursor guifg=white guibg=#6092bb
" highlight iCursor guifg=white guibg=#b6d6f2
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver25-iCursor
" set guicursor+=n-v-c:blinkon0

" Highlight current line
set cursorline
" hi CursorLine cterm=NONE ctermbg=white guibg=white ctermfg=black guifg=black

" Forget compatibility with Vi. Who cares.
set nocompatible

" Make backspace work properly (no setting makes it vi compatible)
set backspace=indent,eol,start

set enc=utf-8

" Enable filetypes
filetype on
filetype plugin on
filetype indent on

" Write the old file out when switching between files.
set autowrite

" Display current cursor position in lower right corner.
set ruler

" Want a different map leader than \
" set mapleader = ","

" Ever notice a slight lag after typing the leader key + command? This lowers
" the timeout.
" set timeoutlen=500

" Switch between buffers without saving
" set hidden
" Don't keep empty buffers
set nohidden

set noswapfile

" Number of space chars that will be inserted when the tab key is pressed
set tabstop=2
" Number of space characters inserted for indentation
set shiftwidth=2
" Makes the spaces feel like real tabs
set softtabstop=2
" To insert space characters whenever the tab key is pressed
set expandtab
set smarttab
set smartindent
set autoindent

set number

" Always show the status line
set laststatus=2

" Better line wrapping
set nowrap
set textwidth=72
set formatoptions=qrn1
" Wrap full words
" set lbr

" Set incremental searching
set incsearch

set lazyredraw

" Highlight searching
set hlsearch
set ignorecase

" Enable code folding
" set foldenable

" Hide mouse when typing
set mousehide

set wildmenu
set wildmode=list:longest,full
set showcmd

" Split windows below the current window.
set splitbelow

" Spell checking
nmap <silent> ,s :set spell!<CR>
set spelllang=en_us

" Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" Shortcut to fold tags with leader + ft
nnoremap <leader>ft Vatzf

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" Open the current file (or selection or provided as arg) in the default app
command! -count=0 -nargs=* -complete=file Open :call s:Open(<count>, <f-args>)
function! s:Open(visual, ...)
  if a:visual
    normal! gv"zy
    let filename = @z
  elseif a:0 > 0
    let filename = a:1
  else
    let filename = expand('%')
  endif

  silent exe '!open '.filename
  redraw!
endfunction

" Faster shortcut for commenting
" map ,c \\\
map <leader>c \\\
map <leader>C \\\j\\\

" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

nmap <space> :

nmap ,z :sh<cr>

nmap <F5> :!touch tmp/restart.txt<cr><cr>

" Auto reload vim when this file is saved
" autocmd bufwritepost .vimrc source $MYVIMRC
map <leader>s :source $MYVIMRC<CR>:nohl<cr>:<esc>

nmap ,ev :tabedit $MYVIMRC<cr>

let g:netrw_list_hide= '.*\.DS_Store$'

" Some abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dapibus felis sed mauris sagittis sodales. Maecenas hendrerit tincidunt nulla vel eleifend. Integer eu ante nisi. Morbi at mollis neque. Donec hendrerit enim ut felis semper fringilla. Morbi scelerisque ligula non risus varius sit amet pharetra ante tristique. Etiam eu ligula lectus. Sed sed cursus diam. Fusce a fringilla purus. Fusce quis nunc nec est laoreet interdum sed ac est. Duis feugiat urna eu odio facilisis sit amet consectetur libero hendrerit. Sed enim elit, faucibus id tincidunt vel, accumsan a nisi. Duis sit amet nisl ullamcorper nulla sagittis tincidunt quis et augue. Etiam nibh ipsum, ullamcorper quis aliquet ut, posuere sed orci. Nulla gravida luctus sapien, in mollis nisl semper at. Nulla tincidunt faucibus metus eget interdum.

" For faster window switching
map <C-j> <C-w>j
map <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" For maximizing window vertically
nmap <c-z> <c-w>_

" Minimum window height, to save space
set wmw=0

" ragtag
let g:ragtag_global_maps = 1

nmap <leader>p :CommandT<cr>
nmap <c-p> :CommandT<cr>
" map <leader>b :CommandTBuffer<cr>
map <leader>rt :CommandTFlush<cr>
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=0

set wildignore+=*.ttf,*.eot,*.svg,*.woff,*.jpg,*.png,*.gif,*.pdf,vendor/*

nmap <leader>f :Ack<space>

" Toggle invisibles
nmap ,l :set list!<CR>

" Indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=236
nmap ,i :IndentGuidesToggle<CR>

" Toggle wrapping
nmap ,w :set nowrap!<CR>

" Remove search highlighting
nmap ,m :nohl<cr>

" Show trailing whitespace:
" highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" Show trailing whitespace
nmap ,; /\s\+$<cr>

" Delete trailing whitespace
nmap ,: :%s/\s\+$<cr>

" Copy current line to clipboard
" nmap ,c :.!pbcopy

" vim-slime configuration (<C-cc> to send to tmux)
let g:slime_target = "tmux"

" Notes
nmap ,ntd :e ~/Dropbox/Notes/TODO.txt<CR>
nmap ,not :e ~/Dropbox/Notes/dawanda\ todo.txt<CR>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

set completefunc=syntaxcomplete#Complete

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

nmap K k
xmap s S


" Join lines without surrounding whitespace
nnoremap gJ :call <SID>JoinWithoutSpaces(0)<cr>
xnoremap gJ :<c-u>call <SID>JoinWithoutSpaces(1)<cr>

function! s:JoinWithoutSpaces(visual)
  if a:visual
    let range = "'<,'>"
  else
    let range = ''
  endif

  let original_cursor = getpos('.')

  exe range.'s/\n\s*//'
  call histdel('search', -1)
  let @/ = histget('search', -1)
  nohl

  call setpos('.', original_cursor)
endfunction


let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nnoremap - :Switch<cr>

let g:todo_switch_definition =
      \ {
      \    '- \[ \]\(.*\)$': '- [x]\1',
      \    '- \[x\]\(.*\)$': '- [ ]\1',
      \ }

autocmd BufEnter,BufNew *.txt set filetype=markdown

function! HTMLEscape()
ruby << EOF
  require 'cgi'
  str = VIM::Buffer.current.line
  VIM::Buffer.current.line = CGI::escapeHTML(str)
EOF
endfunction
nnoremap <Leader>h :call HTMLEscape()<cr>


" Get rid of annoying register rewriting when pasting on visually selected
" text.
"
" Note: magic
function! RestoreRegister()
  let @* = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @*
  return "p@=RestoreRegister()\<cr>"
endfunction
xnoremap <silent> <expr> p <SID>Repl()


map ,t :NERDTreeToggle<cr>
map <tab> :NERDTreeToggle<cr>
let NERDTreeDirArrows = 0
let NERDTreeMinimalUI = 1

" Rebuild tags database:
command! RebuildTags call s:RebuildTags()
function! s:RebuildTags()
  if exists('g:ctags_exclude_patterns')
    let excludes = join(map(copy(g:ctags_exclude_patterns), '''--exclude="''.v:val.''"'''), ' ')
    exe '!ctags -R '.excludes
  else
    !ctags -R .
  endif
endfunction
command! -nargs=+ -bang -complete=dir TagsExclude call s:TagsExclude('<bang>', <f-args>)
function! s:TagsExclude(bang, ...)
  if !exists('g:ctags_exclude_patterns') || (a:bang == '!')
    let g:ctags_exclude_patterns = []
  endif

  call extend(g:ctags_exclude_patterns, a:000)
endfunction


let g:gist_clip_command = 'pbcopy'

" Don't go into Ex mode!
nmap Q <nop>
