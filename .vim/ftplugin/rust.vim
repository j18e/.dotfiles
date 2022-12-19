" let g:rustfmt_autosave = 1
" let g:syntastic_rust_checkers = ['cargo']

" ale
let g:ale_linters = {'rust': ['analyzer', 'cargo', 'rls']}
let b:ale_fixers = {'rust': ['rustfmt']}
let g:ale_set_highlights = 0
