let b:switch_custom_definitions = [
      \ {
      \   'it \([''"].\{-}[''"]\), focus: true': 'it \1',
      \   'it \([''"].\{-}[''"]\) do': 'it \1, focus: true do',
      \ }]

" Rspec focus toggle
nnoremap <buffer> ! ma?^\s*it<space><cr>/it<cr>:Switch<cr>`a:nohl<cr>

nmap ,r :Rlib<space>
nmap ,s :Rspec<space>

" Insert mode shortcuts
imap <C-l> <space>=><space>

