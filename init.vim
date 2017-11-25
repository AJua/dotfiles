set nocompatible

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

if has("nvim")
    Plug 'w0rp/ale'
endif

" Make sure you use single quotes
Plug 'AJua/todo.txt-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kassio/neoterm'
Plug 'ctrlpvim/ctrlp.vim'
Plug '907th/vim-auto-save'
Plug 'jpalardy/vim-slime'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-clang'
Plug 'AJua/summerfruit256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nightsense/simplifysimplify'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'jaxbot/browserlink.vim'

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
set encoding=utf-8
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
if has("nvim")
    set listchars=tab:▸\ ,eol:¬
endif

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

let NERDTreeIgnore=['png', 'build','sound','images','Assets','aspnet_client','min.js','min.css','.map','.suo','.user','.userosscache','.sln.docstates.userprefsebug','debug','release','releases','x64','x86','.dll','DLL','[Bb]in','TestResult','dlldata.cproject.lock.json','artifacts_i.c','_p.c','_i.h','.ilk','.meta','obj','.pch','.pdb','.pgc','.pgd','.rsp','.sbr','.tlb','.tli','.tlh','.tmp','.tmp_proj','.vspscc','.vssscc','.builds','.pidb','.svclog','.scc_Chutzpahipch','.aps','.ncb','.opendb','.opensdf','.sdf','.cachefile','.VC.db','.VC.opendb.psess','.vsp','.vspx','.reharper','.DotSettings.user.JustCode_TeamCity.dotCover_NCrunch_','.crunch.local.xml','nCrunchTemp_.mm.','AutoTest.Net.sass-cachexpressDocProjectbuildhelp','DocProjectHelp.HxT','DocProjectHelp.HxC','DocProjectHelp.hhc','DocProjectHelp.hhk','DocProjectHelp.hhp','DocProjectHelpHtml2','DocProjectHelphtmlpublish.ublish.xml','.azurePubxml','.pubxml','.publishprojPublishScripts.nupkg','packages','packagesbuild','.nuget.props','.nuget.targetscsx','.build.csdefecf','rcfAppPackages','BundleArtifacts','Package.StoreAssociation.xml','_pkginfo.txt.ache','.acheClientBin','.dbmdl','.dbproj.schemaview','.pfx','.publishsettings','node_modules','orleans.codegen.cs','Generated_Code_UpgradeReport_Files','Backup','UpgradeLog.XML','UpgradeLog.htm.mdf','.ldf.rdl.data','.bim.layout','.sln.iml','PrecompiledWeb','Simulator','bundle.js']

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

" browserlink
let g:bl_pagefiletype = ['html', 'javascript', 'php', 'markdown']

" json beautifier
nnoremap <Leader>j :%!python -m json.tool<CR>

" hide search highlight
nnoremap <leader><space> :noh<CR>

if has ("nvim")
    " exit terminal mode
    tnoremap <Esc> <C-\><C-n>

    " switch between splitted window
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" switch between splitted window
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
nnoremap <F10> :T pandoc -t beamer % -o %:r.pdf --latex-engine=xelatex -V CJKmainfont=Songti\ TC\ Regular<CR>

" show/hide \'s symbol
nnoremap <leader>l :set list!<CR>

" personal hotkey preference
inoremap jj <ESC>
inoremap {<CR> {<CR>}<ESC>O<TAB>
inoremap (( ()<LEFT>
inoremap {{ {}<LEFT>
inoremap [[ []<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>

nnoremap ; :
vnoremap ; :
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
nnoremap <CR> o<Esc>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" shortcut to ack
nnoremap <leader>a :Ack 
nnoremap <leader>, :%s/，/, /<CR>

" shortcut to edit vimrc
nnoremap <leader>v :sp<CR>:e ~/dotfiles/init.vim<CR>

colorscheme summerfruit256

if has("gui_running")
    "set guifont=Inconsolata:h14.4:cANSI:qDRAFT
    set guifont=ProFontWindows:h17:cANSI:qDRAFT
	set lines=53 columns=122 linespace=0
endif

" auto save
au FocusLost * :wa

" fix syntax on not working correctly after call vim-plug
au BufReadPre * syntax on

if has('win32')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif
