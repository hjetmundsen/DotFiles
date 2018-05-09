" ~/.vimrc

set laststatus=2
set timeoutlen=1000 ttimeoutlen=0

" Set leader
:let mapleader=" "

" key mappings
:nmap ; :

" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start - all plugins below

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'arcticicestudio/nord-vim'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" NERDTree shortcut
map <Leader>n :NERDTreeToggle<CR>

" Switch between tabs
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Switch between windows
nmap <silent> <Leader>k :wincmd k<CR>
nmap <silent> <Leader>j :wincmd j<CR>
nmap <silent> <Leader>h :wincmd h<CR>
nmap <silent> <Leader>l :wincmd l<CR>

" set color
 colorscheme Tomorrow-Night-Eighties 

" set lightline color
let g:lightline = {
  \ 'colorscheme': 'nord'
  \ }

" === General Settings ===
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2

syntax on
