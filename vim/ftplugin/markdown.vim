" Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

let b:dispatch = 'octodown %'

let g:todo_switch_definition =
      \ {
      \    '- \[ \]\(.*\)$': '- [x]\1',
      \    '- \[x\]\(.*\)$': '- [ ]\1',
      \ }

let b:switch_custom_definitions = [g:todo_switch_definition]

nnoremap <buffer> ,c o- [ ]<space>
" nnoremap <buffer> J :m .+1<cr>==
" nnoremap <buffer> K :m .-2<cr>==
