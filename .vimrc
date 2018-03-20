" ~/.vimrc

set laststatus=2
set timeoutlen=1000 ttimeoutlen=0

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

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" set color
colorscheme onedark 

" set lightline color
let g:lightline = {
  \ 'colorscheme': 'onedark',
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

syntax on
