" Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>

let b:dispatch = 'octodown %'

let b:switch_custom_definitions = [g:todo_switch_definition]
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'bash=sh']


nnoremap <buffer> ,c o- [ ]<space>
" nnoremap <buffer> J :m .+1<cr>==
" nnoremap <buffer> K :m .-2<cr>==
