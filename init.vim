set nocompatible
filetype plugin on
syntax on

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

if has("nvim")
    Plug 'dense-analysis/ale'
endif

" Make sure you use single quotes
"Plug 'github/copilot.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'chrisbra/Colorizer'
Plug 'AJua/todo.txt-vim'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kassio/neoterm'
Plug 'ctrlpvim/ctrlp.vim'
Plug '907th/vim-auto-save'
Plug 'djoshea/vim-autoread'
Plug 'jpalardy/vim-slime'
Plug 'PProvost/vim-ps1'
Plug 'AJua/summerfruit256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nightsense/simplifysimplify'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'jaxbot/browserlink.vim'
Plug 'posva/vim-vue'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'mracos/mermaid.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'nordtheme/vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ledger/vim-ledger'

" Initialize plugin system
call plug#end()
" enable python support
let g:python_host_prog = '/opt/local/bin/python2.7'
let g:python3_host_prog = '/opt/local/bin/python3.10'

" Disable unnecessary providers to avoid health check warnings
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" leader key
let mapleader = ","

set modelines=0
set autoread
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
set number relativenumber
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
    "set listchars=tab:�\ ,eol:�
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

" Deletes the current buffer without closing the window
command! BD bnext | bdelete #
let g:NERDTreeQuitOnLastWindow = 1
let NERDTreeIgnore=['png', 'build','sound','images','Assets','aspnet_client','min.js','min.css','.map','.suo','.user','.userosscache','.sln.docstates.userprefsebug','debug','release','releases','x64','x86','.dll','DLL','[Bb]in','TestResult','dlldata.cproject.lock.json','artifacts_i.c','_p.c','_i.h','.ilk','.meta','obj','.pch','.pdb','.pgc','.pgd','.rsp','.sbr','.tlb','.tli','.tlh','.tmp','.tmp_proj','.vspscc','.vssscc','.builds','.pidb','.svclog','.scc_Chutzpahipch','.aps','.ncb','.opendb','.opensdf','.sdf','.cachefile','.VC.db','.VC.opendb.psess','.vsp','.vspx','.reharper','.DotSettings.user.JustCode_TeamCity.dotCover_NCrunch_','.crunch.local.xml','nCrunchTemp_.mm.','AutoTest.Net.sass-cachexpressDocProjectbuildhelp','DocProjectHelp.HxT','DocProjectHelp.HxC','DocProjectHelp.hhc','DocProjectHelp.hhk','DocProjectHelp.hhp','DocProjectHelpHtml2','DocProjectHelphtmlpublish.ublish.xml','.azurePubxml','.pubxml','.publishprojPublishScripts.nupkg','packagesbuild','.nuget.props','.nuget.targetscsx','.build.csdefecf','rcfAppPackages','BundleArtifacts','Package.StoreAssociation.xml','_pkginfo.txt.ache','.acheClientBin','.dbmdl','.dbproj.schemaview','.pfx','.publishsettings','node_modules','orleans.codegen.cs','Generated_Code_UpgradeReport_Files','Backup','UpgradeLog.XML','UpgradeLog.htm.mdf','.ldf.rdl.data','.bim.layout','.sln.iml','PrecompiledWeb','Simulator','bundle.js']

" Configure vimwiki to be less aggressive
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
            \ {
            \ 'path': '~/vimwiki', 
            \ 'template_path': '~/vimwiki/templates/',
            \ 'template_default': 'default', 
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'path_html': '~/vimwiki/site_html/', 
            \ 'custom_wiki2html': 'vimwiki_markdown',
            \ 'html_filename_parameterization': 1,
            \ 'template_ext': '.tpl'
            \ },
            \ {
            \ 'path': '~/vimwiki', 
            \ 'template_path': '~/vimwiki/templates/',
            \ 'template_default': 'default', 
            \ 'syntax': 'markdown', 'ext': '.md',
            \ 'path_html': '~/vimwiki/site_html/', 
            \ 'custom_wiki2html': 'vimwiki_markdown',
            \ 'html_filename_parameterization': 1,
            \ 'template_ext': '.tpl',
            \ 'index': 'work',
            \ }
            \ ]

nnoremap <leader>n :NERDTree %:p:h<CR> 
nnoremap <leader>a :Ack 

" vim-ale
let g:ale_fixers = { 'python': ['autopep8'], }
let g:ale_fix_on_save = 1
let g:ale_dart_language_server_executable = 'dart'

nnoremap <F12> :ALEGoToDefinition<CR>
nnoremap <F22> :ALEFindReferences<CR>
nnoremap <S-F12> :ALEFindReferences<CR>

nnoremap <leader>ll :e $HOME/Syncthing/ledgers/main.hledger<CR>
nnoremap <leader>ww :VimwikiIndex 1<CR>
nnoremap <leader>kk :VimwikiIndex 2<CR>

" vim-autosave
let g:auto_save = 1 " AutoSave is disabled by default, this will enable AutoSave onVim startup
let g:auto_save_no_updatetime = 1

" vim-slime
if has('win32')
    let g:slime_target = "conemu"
else
    let g:slime_target = "tmux"
    let g:slime_paste_file = "$HOME/.slime_paste"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
    let g:slime_dont_ask_default = 1
endif

" inseat date to be hugo parsable
inoremap <Leader>t <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" browserlink
" let g:bl_pagefiletype = ['html', 'javascript', 'php', 'markdown']

" json beautifier
nnoremap <Leader>j :%!jq .<CR>

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

nnoremap ; :
vnoremap ; :
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
"nnoremap <cr> o<ESC>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l


" shortcut to ack
"
nnoremap <leader>a :Ack 
nnoremap <leader>, :%s/�, /<CR>

" shortcut to edit vimrc
nnoremap <leader>v :sp<CR>:e ~/dotfiles/init.vim<CR>
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" Use this line for syntax-based folding (recommended)
autocmd FileType dart setlocal foldmethod=syntax

if has("gui_running")
    set guifont=Inconsolata:h14.4:cANSI:qDRAFT
    "set guifont=ProFontWindows_NF:h16:cANSI:qDRAFT
    "set guifont=ProFontIIx_NF:h12:cANSI:qDRAFT
    set lines=53 columns=122 linespace=0
endif

" auto save
au FocusLost * :wa

" fix syntax on not working correctly after call vim-plug
au BufReadPre * syntax on

if has('win32') || has('win64')
    set clipboard=unnamed
elseif has('mac') || has('macunix')
    set clipboard=unnamedplus
    colorscheme nord
elseif has('unix')
    set clipboard=unnamedplus
    colorscheme summerfruit256
endif

" MarkdownPreview Config:
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0,
            \ 'toc': {}
            \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '?${name}?'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'light'

au BufNewFile */vimwiki/diary/*.md :silent 0r !~/dotfiles/generate-vimwiki-diary-template '%'

autocmd FileType ledger setlocal foldmethod=syntax
autocmd FileType ledger setlocal foldenable
autocmd FileType ledger setlocal foldlevel=0
autocmd FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
autocmd FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
autocmd FileType ledger inoremap <silent> <C-d> <C-r>=strftime('%Y-%m-%d')<CR>
let g:ledger_is_hledger = 1
let g:ledger_fuzzy_account_completion = 1
let g:ledger_extra_options = '--pedantic --explicit --check-payees'
let g:ledger_default_commodity = 'NT$'

" Place the commodity symbol after the amount
let g:ledger_commodity_before = 1

" Remove the space between the amount and the commodity
let g:ledger_commodity_sep = ''

" Align transactions on the commodity symbol
let g:ledger_align_commodity = 1
let g:ledger_date_format = '%Y-%m-%d'

set laststatus=2  " Always show status line

" Function to get buffer list
function! BuffersList()
    let buffers = []
    for i in range(1, bufnr('$'))
        if buflisted(i) && bufexists(i)
            let name = bufname(i)
            if empty(name)
                let name = '[No Name]'
            else
                let name = fnamemodify(name, ':t')  " Just filename, not full path
            endif

            " Add buffer number and mark current buffer
            if i == bufnr('%')
                call add(buffers, '[' . i . ':' . name . ']')
            else
                call add(buffers, i . ':' . name)
            endif
        endif
    endfor
    return join(buffers, ' ')
endfunction

" Set the statusline to show buffers
set statusline=%{BuffersList()}\ %=%l,%c\ %p%%%y

nnoremap <C-PageDown> :bnext<CR>
nnoremap <C-PageUp> :bprevious<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
" etc...
