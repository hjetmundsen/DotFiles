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
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phanviet/vim-monokai-pro'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" === SHORTCUTS ===

" Toggle Tagbar
nnoremap <Leader>t :TagbarOpenAutoClose<CR>

" FZF
nnoremap <Leader>pf :Files<cr>
nnoremap <Leader>pg :GitFiles<cr>
nnoremap <Leader>pt :Tags<cr>
nnoremap <Leader>pr :Rg<cr>
let g:fzf_preview_window=''

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
set nohlsearch
set mouse=a
set splitbelow
set number relativenumber
set shiftwidth=2
set tabstop=2
set noshowmode
set ignorecase
set smartcase

" Polyglot
let g:python_highlight_space_errors=0
let g:python_highlight_indent_errors=0

" Coc
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
hi EndOfBuffer guifg=bg
hi StatusLine guibg=None guifg=white
hi StatusLineNC guibg=None guifg=white
hi SignColumn guibg=None
hi VertSplit guibg=None

" Statusline
set laststatus=0
set noruler
set noshowcmd

" Minimalism
augroup cmdline
  autocmd CmdlineLeave : echo ''
augroup END
