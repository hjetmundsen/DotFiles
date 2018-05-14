" ~/.vimrc

set laststatus=2
set timeoutlen=1000
set ttimeoutlen=0

" === MAPPINGS ===

" Set leader
:let mapleader=" "

" key mappings
:nmap ; :

" === PLUGINS ===

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start - all plugins below

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'

" stop - all plugins above
call vundle#end()

" === SHORTCUTS ===

" Toggle NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Switch between tabs
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Switch between windows
nmap <silent> <Leader>k :wincmd k<CR>
nmap <silent> <Leader>j :wincmd j<CR>
nmap <silent> <Leader>h :wincmd h<CR>
nmap <silent> <Leader>l :wincmd l<CR>
nmap <silent> <Leader>x :wincmd x<CR>

" === SETTINGS ===

" General
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
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

syntax on
