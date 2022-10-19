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

" -----------------------------------------------------------------
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

autocmd BufWritePre * :call StripTrailingWhitespace()
