nnoremap <leader>e oif err != nil {<CR>return err<CR>}<ESC>

" vim-go
" let g:go_doc_keywordprg_enabled = 0 " this set to 1 conflicts with our use of K
" let g:go_doc_popup_window = 1
" let g:go_fmt_command = "goimports" " goimports, unlike gofmt, fixes imports
" nnoremap <leader>d :GoDoc<CR>
" nnoremap <leader>r :GoRun<CR>

" govim
" nnoremap <leader>ref :GOVIMReferences<CR>
" nnoremap <leader>mv :GOVIMRename
" call govim#config#Set("ExperimentalProgressPopups", 1)
" call govim#config#Set("FormatOnSave", "gofmt")

nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>

call govim#config#Set("Gofumpt", 1)

set noexpandtab
let g:gotests_template_dir = '/Users/jamie.wiebe/repos/gh/gotests/internal/render/templates'
