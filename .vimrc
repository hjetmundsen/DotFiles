" ~/.config/nvim/init.vim

set ttimeoutlen=0

" Required if fzf is installed through Homebrew
set rtp+=/usr/local/opt/fzf

" === MAPPINGS ===

let mapleader=" "
noremap ; :
noremap : ;

" === PLUGINS ===

" Initialize Vim Plug
call plug#begin('~/.config/nvim/plugged')

" Plugin List
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phanviet/vim-monokai-pro'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

call plug#end()

" === SHORTCUTS ===

" Toggle Tagbar
nnoremap <Leader>t :TagbarOpenAutoClose<CR>

" FZF
nnoremap <Leader>pf :Files<cr>
nnoremap <Leader>pg :GitFiles<cr>
nnoremap <Leader>pt :Tags<cr>
nnoremap <Leader>pr :Rg<cr>

" Buffers
nnoremap <Leader>bb :Buffers<cr>
nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>bp :bprevious<cr>
nmap <Leader>bd <Plug>Kwbd<cr>

" Fugitive
nnoremap <Leader>gg :G<cr>

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

" Polyglot
let g:python_highlight_space_errors=0
let g:python_highlight_indent_errors=0

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

" Filetype
filetype plugin indent on

" Syntax
syntax on

" Highlight
hi LineNr guibg=None
hi EndOfBuffer guifg=None
hi StatusLine guibg=None guifg=white
hi StatusLineNC guibg=None guifg=white
hi SignColumn guibg=None
hi VertSplit guibg=None

" Statusline
set statusline+=\ %f
