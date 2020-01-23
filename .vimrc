" ~/.vimrc

set ttimeoutlen=0

" === MAPPINGS ===

" Leader
let mapleader=" "

" Single Keys
noremap ; :
noremap : ;

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" === PLUGINS ===

" Initialize Vim Plug
call plug#begin('~/.vim/plugged')

" Plugin List
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phanviet/vim-monokai-pro'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

call plug#end()

" === SHORTCUTS ===

" Toggle Tagbar
map <Leader>t ;TagbarOpenAutoClose<CR>

" Tab Switching
map <C-l> ;tabn<CR>
map <C-h> ;tabp<CR>

" Window Switching
nmap <silent> <Leader>k ;wincmd k<CR>
nmap <silent> <Leader>j ;wincmd j<CR>
nmap <silent> <Leader>h ;wincmd h<CR>
nmap <silent> <Leader>l ;wincmd l<CR>
nmap <silent> <Leader>x ;wincmd x<CR>

" FZF
nnoremap <Leader>pf :Files<cr>
nnoremap <Leader>pg :GitFiles<cr>
nnoremap <Leader>pt :Tags<cr>
nnoremap <Leader>pr :Rg<cr>

" Buffers
nnoremap <Leader>bb :Buffers<cr>
nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>bp :bprevious<cr>
nnoremap <Leader>bk :bdelete<cr>

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
"set colorcolumn=80

" Coc
set cmdheight=2
set updatetime=300

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Color
set background=dark
set termguicolors
colorscheme monokai_pro

" Delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1

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
