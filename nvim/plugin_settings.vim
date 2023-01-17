let g:netrw_list_hide= '.*\.DS_Store$'

let g:ragtag_global_maps = 1

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'

let g:gist_clip_command = 'pbcopy'

let g:CtrlSpaceSetDefaultMapping = 0

let g:todo_switch_definition =
  \ {
  \    '- \[ \]\(.*\)$': '- [x]\1',
  \    '- \[x\]\(.*\)$': '- [ ]\1',
  \ }
  " \ {
  " \    '- \[ \]\(.*\)$': '- [x]\1',
  " \    '- \[x\]\(.*\)$': '- [-]\1',
  " \    '- \[-\]\(.*\)$': '- [ ]\1',
  " \ }
let g:switch_custom_definitions = [g:todo_switch_definition]

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1.2"}
let g:slime_dont_ask_default = 1

" let g:vroom_use_vimux = 1

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.erb'

let g:jsx_ext_required = 0

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

" -----------------------------------------------
" ALE - Asynchronous Lint Engine

let g:ale_sign_error = '! '
let g:ale_sign_warning = '. '
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options = {
\   'db/schema\.rb$': { 'ale_enabled': 0 },
\ }
let g:ale_linters = {
\   'ruby': ['brakeman', 'reek', 'rubocop', 'ruby', 'sorbet'],
\   'javascript': ['standard'],
\   'markdown': ['proselint']
\ }
" let g:ale_fixers = {'ruby': ['standardrb'], 'javascript': ['standard']}
" let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" -----------------------------------------------
" Lightline
if system("dark-or-light") == "light"
  " let lightlinetheme = 'PaperColor'
  " let lightlinetheme = 'one'
  " let lightlinetheme = 'rosepine'
  let lightlinetheme = 'Tomorrow'
else
  " let lightlinetheme = 'nord'
  let lightlinetheme = 'wombat'
endif
let g:lightline = {
  \ 'colorscheme': lightlinetheme,
  \ 'active': {
  \   'left': [['mode', 'paste', 'gitbranch'], ['filename', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
  \ },
  \ 'mode_map': {
  \   'n' : 'N',
  \   'i' : 'I',
  \   'R' : 'R',
  \   'v' : 'V',
  \   'V' : 'VL',
  \   "\<C-v>": 'VB',
  \   'c' : 'C',
  \   's' : 'S',
  \   'S' : 'SL',
  \   "\<C-s>": 'SB',
  \   't': 'T',
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
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \ },
\ }

" This is here to override the `filename` component for lightline in order to:
" - Show the relative path instead of just the filename
" - Show a shorter New instead of [No Name]
function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:.') : 'New'
endfunction

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

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'PreProc'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Normal'] }

let g:vimwiki_list = [{'path': '~/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
