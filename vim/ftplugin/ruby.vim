let b:switch_custom_definitions = [
      \ {
      \   'it \([''"].\{-}[''"]\), focus: true': 'it \1',
      \   'it \([''"].\{-}[''"]\) do': 'it \1, focus: true do',
      \ }]

" Rspec focus toggle
" nnoremap <buffer> ! ma?^\s*it<space><cr>/it<cr>:Switch<cr>`a:nohl<cr>

" Insert mode shortcuts
iab elrb expect(last_response.body).to
iab elrs expect(last_response.status).to eq 200
