" ~/.vimrc

set laststatus=2
set timeoutlen=1000
set ttimeoutlen=0

" === MAPPINGS ===

" Leader
:let mapleader=" "

" Single Keys
:noremap ; :
:noremap : ;

" === PLUGINS ===

" Initialize Vundle
call plug#begin('~/.vim/plugged')

" Plugin List
Plug 'alvan/vim-closetag'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'

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
set number relativenumber
set showcmd
set incsearch
set nohlsearch
set expandtab
:set tabstop=2
:set shiftwidth=2
:set expandtab

" Deoplete
let g:deoplete#enable_at_startup = 1

" Mouse
set mouse=a

" Color
set background=dark
set termguicolors
colorscheme gruvbox

" Lightline
set noshowmode
let g:lightline = { 'colorscheme': 'gruvbox' }

" Closetag
let g:closetag_filenames = '*.html, *.html.erb'

" Delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1

" Filetype
filetype plugin indent on

" Syntax
syntax on

" Highlight
hi LineNr guibg=bg
highlight EndOfBuffer guifg=bg

set statusline=%=%P\ %f\ %m
