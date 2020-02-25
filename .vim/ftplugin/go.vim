nnoremap <leader>e oif err != nil {<CR>log.Fatal(err)<CR>}<ESC>

" vim-go
let g:go_doc_keywordprg_enabled = 0 " this set to 1 conflicts with our use of K
let g:go_doc_popup_window = 1
let g:go_fmt_command = "goimports" " goimports, unlike gofmt, fixes imports
nnoremap <leader>d :GoDoc<CR>
nnoremap <leader>r :GoRun<CR>
