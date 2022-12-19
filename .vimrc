" Open fold with za, close with zc
" Open all folds with zR, close all with zM

" Initial {
  set nocompatible
  autocmd! bufwritepost ~/.vimrc source % | :AirlineRefresh| :AirlineRefresh
  filetype off

  " Install Vundle if not present {
    if !filereadable(expand('~/.vim/bundle/Vundle.vim/README.md'))
      echo 'Installing Vundle...'
      echo ''
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    endif
  " }

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" }

" User Plugins {
  Plugin 'airblade/vim-gitgutter'
  Plugin 'chriskempson/base16-vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'godlygeek/tabular'

  Plugin 'dkarter/bullets.vim'
  Plugin 'editorconfig/editorconfig-vim'

  Plugin 'nvie/vim-flake8'
  Plugin 'tpope/vim-abolish'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround.git'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'dense-analysis/ale'
  Plugin 'easymotion/vim-easymotion'

  " set rtp+=/usr/local/opt/fzf
  Plugin 'junegunn/fzf.vim'

" Filetype specific plugins
  " Plugin 'govim/govim'
  " Plugin 'rust-lang/rust.vim'

  Plugin 'cespare/vim-toml'
  Plugin 'sirtaj/vim-openscad'
  Plugin 'Valloric/python-indent'
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'hashivim/vim-terraform.git'
  Plugin 'tpope/vim-markdown' " Tabular must come before this line
  Plugin 'othree/html5.vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'fatih/vim-hclfmt'
  Plugin 'JamshedVesuna/vim-markdown-preview'
  Plugin 'sudar/vim-arduino-syntax'
  Plugin 'turbio/bracey.vim'
" }

" Vundle end, plugins must come before this {
  call vundle#end()
  filetype plugin indent on
" }

" Colors {
"  set termguicolors
  set t_Co=256
  let base16colorspace=256
  colorscheme base16-oceanicnext
" }

" { LF
function! LF()
  let temp = tempname()
  exec 'silent !lf -selection-path=' . shellescape(temp) . expand(' %')
  if !filereadable(temp)
    redraw!
    return
  endif
  let names = readfile(temp)
  if empty(names)
    redraw!
    return
  endif
  exec 'edit ' . fnameescape(names[0])
  for name in names[1:]
    exec 'argadd ' . fnameescape(name)
  endfor
  redraw!
endfunction
command! -bar LF call LF()
" }

" Basics {
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  set mouse=a
  set ttymouse=sgr
  let loaded_netrwPlugin = 1
  let mapleader="\<space>"
  map <C-n> :LF<CR>
  noremap <C-p> :FZF<CR>
  noremap H ^
  noremap J 10j
  noremap K 10k
  noremap L $
  set clipboard=unnamed
  set cursorline
  set encoding=utf-8
  set hidden
  set laststatus=2
  set nobackup
  set noshowmode
  set noswapfile
  set nowritebackup
  set number
  set relativenumber
  set ruler
  set scrolloff=10
  set showcmd
  set timeoutlen=1000 ttimeoutlen=0
  set title
  set wildmenu
  syntax enable
  set nowrap
  " Disable bells
  set noeb vb t_vb=
  au GUIEnter * set vb t_vb= set updatetime=250
" }

" ALE {
  set omnifunc=ale#completion#OmniFunc
  let g:ale_completion_enabled = 1
  let g:ale_completion_autoimport = 1
  let g:airline#extensions#ale#enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_set_balloons = 1
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  nmap <silent> <C-]> :ALEGoToDefinition<CR>
  let g:ale_set_highlights = 0
	nnoremap <leader>ar :ALERename<CR><C-w>
" }

" Easymotion {
  let g:EasyMotion_do_mapping = 0 " Disable default mappings
  map t <Plug>(easymotion-overwin-f2)
  let g:EasyMotion_smartcase = 1 " type `l` and match `l`&`L`
" }

" Leader shortcuts {
  nnoremap <silent> <leader>J j:s/^\s\+//g<CR>:nohlsearch<CR>I<BS><ESC>
  nnoremap <leader>yy ggyG
  nnoremap <leader>j :join<CR>
  vnoremap <leader>j :join<CR>
  nnoremap <leader>rg :Rg<CR>
  noremap <leader>ft :set filetype=
  noremap <leader>wr :set wrap!<CR>
  noremap <leader>ws :%s/\s\+$//g<CR>
  noremap <leader>lws :s/^\s\+//g<CR>
  noremap <leader><space> :nohlsearch<CR>
  " text input
  noremap <leader>` o```<Esc>o```<Esc>O
  " splits, buffers
  noremap <leader>bd :bp\|bd #<CR>
  nnoremap <leader>sc <C-w>c
  nnoremap <leader>sv :vsp<cr>
  nnoremap <leader>sp :vsp<cr>
  nnoremap <leader>= <c-w>=
  " yaml files
  nnoremap <leader>yld I{<end>}<esc>kJ^
  nnoremap <leader>yll ^dwi[<end>]<esc>kJ^
  " git
  nnoremap <leader>va :Gwrite<CR>
  nnoremap <leader>vc :Gcommit -m '
  nnoremap <leader>vp :Gpush<CR>
  nnoremap <leader>vl :Gpull<CR>
" }

" Tab Characters {
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set smarttab
  set expandtab
  set autoindent
  set backspace=indent,eol,start
" }

" filetypes {
  au BufNewFile,BufRead *.slide set filetype=markdown
  au BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  au BufNewFile,BufRead *.tf,*.hcl set filetype=terraform
  au BufNewFile,BufRead *.pp set filetype=config
  au BufNewFile,BufRead *.gohtml set filetype=html
  au BufNewFile,BufRead *.kt set filetype=java
  au BufNewFile,BufRead Jenkinsfile setf groovy

  au BufNewFile main.go 0r ~/.dotfiles/tpl/tpl.go
  au BufNewFile *_test.go 0r ~/.dotfiles/tpl/tpl_test.go

  let g:user_emmet_install_global = 0
  autocmd FileType html,css,qtpl EmmetInstall
" }

" Splits, buffers {
  set splitbelow
  set splitright
  map <C-h> :bp<CR>
  map <C-l> :bn<CR>
  imap <C-h> <Esc>:bp<CR>
  imap <C-l> <Esc>:bn<CR>
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_working_path_mode = 'a'
" }

" Find {
  set hlsearch
  set incsearch
  set ignorecase
  set smartcase " don't ignore case if search term has capital
  set path+=** " sets path to current directory for find command
" }

" Airline {
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
  set laststatus=2
" }

" Bullets {
  let g:bullets_enabled_file_types = [
      \ 'markdown',
      \ 'text',
      \ 'gitcommit',
      \ 'scratch',
      \]
"     \ 'yaml'
" }

" { vim-indent-guides
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  highlight IndentGuidesOdd  ctermbg=18 guibg=#282a2e
  highlight IndentGuidesEven ctermbg=18 guibg=#282a2e
  au VimEnter * :IndentGuidesEnable
" }

" { Tmux integration
  " in iterm, make sure the alt key(s) is set to Esc+
  " switching between panes with alt will only work inside tmux
  let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <M-j> :TmuxNavigateUp<cr>
    nnoremap <silent> <M-k> :TmuxNavigateRight<cr>
" }
