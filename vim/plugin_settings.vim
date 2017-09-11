let g:netrw_list_hide= '.*\.DS_Store$'

let g:ragtag_global_maps = 1

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'

let g:gist_clip_command = 'pbcopy'

" Airline -------------------------------------------------------------
"
" enable tender airline theme
let g:tender_airline = 1
" set airline theme
" while loading tender doesn't properly load..
let g:airline_theme='bubblegum'
" let g:airline_theme='tender'
" :AirlineTheme tender

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
let g:airline#extensions#hunks#enabled = 0
" ---------------------------------------------------------------------

let g:ctrlp_abbrev = {
  \   'abbrevs': [
  \     {
  \       'pattern': '\ ',
  \       'expanded': '',
  \     },
  \   ]
  \ }

let g:CtrlSpaceSetDefaultMapping = 0

let g:syntastic_ruby_checkers = ['mri', 'reek', 'rubocop', 'rubylint']
let g:syntastic_javascript_checkers=['standard']
let g:syntastic_javascript_standard_exec = 'semistandard'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "passive" }
" let g:syntastic_mode_map = {
"     \ "mode": "passive",
"     \ "active_filetypes": ["ruby", "php"],
"     \ "passive_filetypes": ["puppet"] }

let g:todo_switch_definition =
  \ {
  \    '- \[ \]\(.*\)$': '- [x]\1',
  \    '- \[x\]\(.*\)$': '- [ ]\1',
  \ }

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1.2"}
let g:slime_dont_ask_default = 1

let g:vroom_use_vimux = 1

let g:rspec_command = "Dispatch rspec {spec}"

let g:vrc_trigger = '<c-g>'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'
