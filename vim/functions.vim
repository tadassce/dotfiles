" Strip trailing whitespace
function! StripTrailingWhitespace()
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


function! JoinWithoutSpaces(visual)
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


function! HTMLEscape()
ruby << EOF
  require 'cgi'
  str = VIM::Buffer.current.line
  VIM::Buffer.current.line = CGI::escapeHTML(str)
EOF
endfunction


" Get rid of annoying register rewriting when pasting on visually
" selected text. Note: magic
function! RestoreRegister()
  let @* = s:restore_reg
  return ''
endfunction
function! Repl()
  let s:restore_reg = @*
  return "p@=RestoreRegister()\<cr>"
endfunction


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


command! ShowColors call ShowColors()
function! ShowColors()
  let num = 255
  while num >= 0
    exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
    exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
    call append(0, 'ctermbg='.num.':....')
    let num = num - 1
  endwhile
endfunction

" Unminify JS
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>


function! s:get_alternate()
  " strip path and extension from current file
  let fname = expand('%:t:r')

  " foo.rb => foo_test.rb => foo.rb
  if fname =~ '_test'
    return substitute(fname , '_test', '.rb', '')
  else
    return fname . '_test.rb'
endfunction

command! AA call fzf#run({ 'options': '--select-1 --query ' . s:get_alternate() . '$', 'sink': 'e' })
command! AAH call fzf#run({ 'options': '--select-1 --query ' . s:get_alternate() . '$', 'sink': 'spl' })
command! AAV call fzf#run({ 'options': '--select-1 --query ' . s:get_alternate() . '$', 'sink': 'vspl' })
