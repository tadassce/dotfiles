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

" -----------------------------------------------------------------
" Enhanced increment (/decrement). Default one is <c-a>
function! AddSubtract(char, back)
  let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
  call search(pattern, 'cw' . a:back)
  execute 'normal! ' . v:count1 . a:char
  silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction
nnoremap <silent>         <C-i> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-i> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
" nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
" nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>
