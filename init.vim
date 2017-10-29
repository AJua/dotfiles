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
Plug '907th/vim-auto-save'
Plug 'jpalardy/vim-slime'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-clang'
Plug 'AJua/summerfruit256.vim'

" Initialize plugin system
call plug#end()

" enable python support
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" leader key
let mapleader = ","

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
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
" Use deoplete.
let g:deoplete#enable_at_startup = 1

" let Plug 'zchee/deoplete-clang' work correcly
" execute `mdfind -name libclang.dylib` within bash on mac to find the location
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/5.0.0/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/5.0.0/lib/clang"

" vim-ale
let g:ale_fixers = { 'python': ['autopep8'], }
let g:ale_fix_on_save = 1

" vim-autosave
let g:auto_save = 1 " AutoSave is disabled by default, this will enable AutoSave onVim startup
let g:auto_save_no_updatetime = 1

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

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
