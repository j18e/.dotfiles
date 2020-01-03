" Open fold with za, close with zc
" Open all folds with zR, close all with zM

" Initial {
  set nocompatible
  autocmd! bufwritepost ~/.vimrc source % | :AirlineRefresh| :AirlineRefresh
  filetype off

  " Install Vundle if not present {
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
      echo 'Installing Vundle...'
      echo ''
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
      let iCanHazVundle=0
      echo $iCanHazVundle
    endif
  " }

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" }

" User Plugins {
  Plugin 'airblade/vim-gitgutter'
  Plugin 'cespare/vim-toml'
  Plugin 'chriskempson/base16-vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'dkarter/bullets.vim'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'francoiscabrol/ranger.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'jremmen/vim-ripgrep'
  Plugin 'mtth/scratch.vim'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'nvie/vim-flake8'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-abolish'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround.git'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'vim-scripts/vim-auto-save'

  set rtp+=/usr/local/opt/fzf
  Plugin 'junegunn/fzf.vim'

" Filetype specific plugins
  Plugin 'Valloric/python-indent'
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'chr4/nginx.vim'
  Plugin 'hashivim/vim-terraform.git'
  Plugin 'tpope/vim-markdown' " Tabular must come before this line
  Plugin 'fatih/vim-go'
  Plugin 'fatih/vim-hclfmt'
  Plugin 'JamshedVesuna/vim-markdown-preview'
  Plugin 'elzr/vim-json'
  Plugin 'sudar/vim-arduino-syntax'

  " Install plugins if vundle just installed {
    if iCanHazVundle == 0
      echo 'Installing Plugins, please ignore key map error messages'
      echo ''
      :PluginInstall
    endif
  " }

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

" { Syntax
  let g:is_bash = 1
  au BufNewFile,BufRead Jenkinsfile setf groovy
" }

" Basics {
  let loaded_netrwPlugin = 1
  let mapleader="\<space>"
  map <C-n> :Ranger<CR>
  noremap <C-p> :FZF<CR>
  let g:ranger_replace_netrw = 1
  noremap <C-j> 40j
  noremap <C-k> 40k
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
  set scrolloff=20
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

" Leader shortcuts {
  nnoremap <leader>yy ggyG
  nnoremap <leader>pwd :pwd<CR>
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
  au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
  au BufNewFile,BufRead *.py
    \ set fileformat=unix
  let python_highlight_all=1
  let g:pyindent_continue = '&sw'
  au BufRead,BufNewFile Dockerfile* set filetype=dockerfile
  au BufNewFile,BufRead *.tf,*.hcl
    \ set filetype=terraform |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
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

" { golang
  let g:go_doc_keywordprg_enabled = 0
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

" { Finishing up
  setlocal softtabstop=2 shiftwidth=2 expandtab
" }
