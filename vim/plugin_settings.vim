let g:netrw_list_hide= '.*\.DS_Store$'

let g:ragtag_global_maps = 1

let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'

let g:gist_clip_command = 'pbcopy'

let g:ctrlp_abbrev = {
  \   'abbrevs': [
  \     {
  \       'pattern': '\ ',
  \       'expanded': '',
  \     },
  \   ]
  \ }

let g:CtrlSpaceSetDefaultMapping = 0

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

" ALE - Asynchronous Lint Engine
let g:ale_sign_error = '! '
let g:ale_sign_warning = '. '
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" -----------------------------------------------
" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
" / Lightline
" -----------------------------------------------
