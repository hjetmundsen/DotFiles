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
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin List
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

call vundle#end()

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

" Page up and down
nmap <silent> <Leader>f <C-f><CR>
nmap <silent> <Leader>b <C-b><CR>

" === SETTINGS ===

" General
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set nohlsearch
set expandtab
set tabstop=2
set shiftwidth=2

" Color
set background=dark
colorscheme gruvbox

" Lightline
let g:lightline = {'colorscheme': 'gruvbox'}

" Closetag
let g:closetag_filenames = '*.html, *.html.erb'

" Delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1

" Filetype
filetype plugin indent on

" Syntax
syntax on
