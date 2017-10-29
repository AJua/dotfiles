set nocompatible

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'kassio/neoterm'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'AJua/summerfruit256.vim'

" Initialize plugin system
call plug#end()

" enable python support
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" leader key
let mapleader = ","

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Use system default setting to display chinese
"set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set textwidth=79
set formatoptions=qrn1
set listchars=tab:▸\ ,eol:¬

set foldmethod=syntax
set foldlevelstart=3
set foldnestmax=3
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

nnoremap <leader>n :NERDTree %:p:h<CR> 
nnoremap <leader>a :Ack 

" json beautifier
nnoremap <Leader>j :%!python -m json.tool<CR>

" hide search highlight
nnoremap <leader><space> :noh<CR>

" exit terminal mode
tnoremap <Esc> <C-\><C-n>

" switch between splitted window
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" adjust the splitted window size
nnoremap <left> :vertical resize +3<cr> 
nnoremap <right> :vertical resize -3<cr>
nnoremap <up> :resize -3<cr>
nnoremap <down> :resize +3<cr>

" compile with clang and execute
nnoremap <F9> :T cc % -o %:r && ./%:r<CR>

" show/hide \'s symbol
nnoremap <leader>l :set list!<CR>

" personal hotkey preference
inoremap jj <ESC>
nnoremap ; :
vnoremap ; :

colorscheme summerfruit256

" auto save
au FocusLost * :wa

" fix syntax on not working correctly after call vim-plug
au Bufenter * syntax on

set clipboard=unnamedplus