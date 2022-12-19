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

" nnoremap <leader>gr :GOVIMRename<Space>

" call govim#config#Set("Gofumpt", 1)

set noexpandtab
" let g:gotests_template_dir = '/Users/jamie.wiebe/repos/gh/gotests/internal/render/templates'


" ale
let b:ale_linters = ['gopls', 'staticcheck']
let b:ale_fixers = ['gofumpt', 'goimports', 'remove_trailing_lines', 'trim_whitespace']


" Available Linters: [
"  'bingo',
"  'cspell',
"  'gobuild',
"  'gofmt',
"  'golangci-lint',
"  'golint',
"  'gometalinter',
"  'gopls',
"  'gosimple',
"  'gotype',
"  'govet',
"  'golangserver',
"  'revive',
"  'staticcheck'
"  ]
" Suggested Fixers:
"  'gofmt' - Fix Go files with go fmt.
"  'gofumpt' - Fix Go files with gofumpt, a stricter go fmt.
"  'goimports' - Fix Go files imports with goimports.
"  'golines' - Fix Go file long lines with golines
"  'remove_trailing_lines' - Remove all blank lines at the end of a file.
"  'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
