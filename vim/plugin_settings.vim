let g:netrw_list_hide= '.*\.DS_Store$'

let g:ragtag_global_maps = 1

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

let NERDTreeDirArrows = 0
let NERDTreeMinimalUI = 1

let g:gist_clip_command = 'pbcopy'

let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline#extensions#tabline#enabled = 1 " :set showtabline=0/1/2
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:syntastic_ruby_checkers = ['mri', 'reek', 'rubocop', 'rubylint']
let g:syntastic_mode_map = { "mode": "passive" }

let g:todo_switch_definition =
  \ {
  \    '- \[ \]\(.*\)$': '- [x]\1',
  \    '- \[x\]\(.*\)$': '- [ ]\1',
  \ }

" GitGutter
highlight SignColumn ctermbg=234
