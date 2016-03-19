let b:switch_custom_definitions = [
      \ {
      \   'it \([''"].\{-}[''"]\), focus: true': 'it \1',
      \   'it \([''"].\{-}[''"]\) do': 'it \1, focus: true do',
      \ }]

" Rspec focus toggle
nnoremap <buffer> ! ma?^\s*it<space><cr>/it<cr>:Switch<cr>`a:nohl<cr>

" nmap ,r :!rspec<cr>
" nmap ,s :SlimeSend1 rspec<cr>
nmap ,r :Dispatch rspec<cr>
" nmap ,c :Copen<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Insert mode shortcuts
imap <C-l> <space>=><space>

iab elrb expect(last_response.body).to
iab elrs expect(last_response.status).to eq 200

nmap <buffer> ,m <Plug>(xmpfilter-mark)
xmap <buffer> ,m <Plug>(xmpfilter-mark)
nmap <buffer> ,x <Plug>(xmpfilter-run)
xmap <buffer> ,x <Plug>(xmpfilter-run)
