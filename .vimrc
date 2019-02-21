" ~/.vimrc

set ttimeoutlen=0

" === MAPPINGS ===

" Leader
let mapleader=" "

" Single Keys
noremap ; :
noremap : ;

" === PLUGINS ===

" Initialize Vim Plug
call plug#begin('~/.vim/plugged')

" Plugin List
Plug 'phanviet/vim-monokai-pro'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'

call plug#end()

" === SHORTCUTS ===

" Toggle NERDTree
map <Leader>n ;NERDTreeToggle<CR>

" Tab Switching
map <C-l> ;tabn<CR>
map <C-h> ;tabp<CR>

" Window Switching
nmap <silent> <Leader>k ;wincmd k<CR>
nmap <silent> <Leader>j ;wincmd j<CR>
nmap <silent> <Leader>h ;wincmd h<CR>
nmap <silent> <Leader>l ;wincmd l<CR>
nmap <silent> <Leader>x ;wincmd x<CR>

" Page movement
nmap <silent> <Leader>f <C-f><CR>
nmap <silent> <Leader>b <C-b><CR>
nmap <silent> <Leader>d <C-d><CR>
nmap <silent> <Leader>u <C-u><CR>

" === SETTINGS ===

" General
set backspace=indent,eol,start
set expandtab
set incsearch
set mouse=a
set nohlsearch
set number relativenumber
set shiftwidth=2
set showcmd
set splitbelow
set splitright
set tabstop=2

" Color
set background=dark
set termguicolors
colorscheme monokai_pro

" Delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Filetype
filetype plugin indent on

" Syntax
syntax on

" Highlight
hi LineNr guibg=bg
hi EndOfBuffer guifg=bg
hi StatusLine guibg=bg guifg=white
"hi StatusLineNC guibg=bg guifg=white

" Statusline
set statusline+=\ %f
