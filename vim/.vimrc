set modelines=0 nomodeline nocompatible

"""Plug.vim Plugins {{{
silent! if plug#begin()
        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/nerdcommenter'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-endwise'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb'
        Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
        Plug 'AndrewRadev/splitjoin.vim'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'airblade/vim-gitgutter'
        Plug 'w0rp/ale'
        Plug 'liuchengxu/vista.vim'
        Plug 'puremourning/vimspector'
        Plug 'mhinz/vim-startify'
        Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}
        Plug 'itchyny/lightline.vim'

        if has('python3')
            Plug 'python-mode/python-mode'
            if(! $MYSYSTEM == "TERMUX")
                Plug 'Valloric/YouCompleteMe'
            endif
            if($MYSYSTEM == "TERMUX")
                Plug 'Shougo/deoplete.nvim'
                Plug 'roxma/nvim-yarp'
                Plug 'roxma/vim-hug-neovim-rpc'
            endif
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
        endif

        Plug 'altercation/vim-colors-solarized'
        Plug 'tomasr/molokai'
        Plug 'chriskempson/vim-tomorrow-theme'
        Plug 'morhetz/gruvbox'
        Plug 'yuttie/hydrangea-vim'
        Plug 'tyrannicaltoucan/vim-deep-space'
        Plug 'AlessandroYorba/Despacio'
        Plug 'cocopon/iceberg.vim'
        Plug 'w0ng/vim-hybrid'
        Plug 'nightsense/snow'
        Plug 'nightsense/stellarized'
        Plug 'arcticicestudio/nord-vim'
        Plug 'nightsense/cosmic_latte'
    call plug#end()
endif
"""}}}
"""Set defualt vim options {{{
filetype plugin indent on
syntax enable
set termguicolors
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set ruler
set laststatus=2
set foldmethod=marker
set showcmd
set showmode
set wrap
set breakindent
set linebreak
set encoding=utf-8
set number
set relativenumber
set splitbelow
set splitright
set hlsearch
set incsearch
set title
set undolevels=10000
set history=10000
set visualbell
set noerrorbells
set path+=**
set wildmenu
set colorcolumn=80
set t_Co=256
set hidden
set backspace=indent,eol,start
set noshowmode
"set textwidth=80
set background=dark
silent! colo solarized
"""}}}
"""Platform Settings {{{
if has('win64') || has('win32')
    set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe
    set shellcmdFlag=-command
    set shellquote=\"
    set shellxquote=
endif

if has('unix')
    hi clear OverLength
    hi OverLength term=underline ctermfg=9 guifg=Magenta
endif
"""}}}

"""Plugin Settings {{{
"""Startup for Startify and NERDTree
augroup StartifyNerdtree
    autocmd StdinReadPre * let s:std_in = 1
    autocmd VimEnter * nested if !argc() && !exists('s:std_in') | silent! Startify | silent! NERDTree | wincmd p | endif
    "autocmd VimEnter * silent! NERDTree | wincmd p
    "autocmd Filetype python call s:PythonMode()
augroup END

"""Startify
let g:startify_bookmarks = ['~/.vimrc', '~/.bashrc', '~/.profile', '~/.aliasrc']
let g:startify_change_to_dir = 1

"""NERDTree
let NERDTreeIngore = ['\.pyc$', '\.pyo$', '__pycache__$', '\.gitingore']
let NERDTreeWinSize = 30
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '<'

"""NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

"""Airline config
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': { 
            \ 'left': [['mode', 'paste'], ['RO', 'filename', 'modified', 'git-branch', 'git-gutter']],
            \ 'right': [['lineinfo'], ['percent'], 
            \ ['fileformat', 'fileencoding', 'filetype'], ['ale-error', 'vista']]
            \ }, 'component_function': {
            \ 'git-branch': 'fugitive#head',
            \ 'git-gutter': 'StatusGit',
            \ 'ale-error': 'StatusAle',
            \ 'vista': 'StatusVista'
            \ }
            \ }
let g:airline_theme='solarized'

"""Ale
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

if has('python3')
"""YCM
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"""Deoplete
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#option('sources', {
                \ '_': ['ale'],
                \ })
"""Ultisnips
    let g:UltiSnipsExpandTrigger = "<Tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    "let g:UltiSnipsEditSplit = "vertical"
endif

"""IndentLine
autocmd vimenter * IndentLinesEnable
let g:indentLine_enabled = 1
let g:indentLine_color_term = 200
let g:indentLine_char = '|'
"""}}}

"""Highlight for Pmenu
highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermbg=gray gui=bold

"Clear the over 80 char red highligths and replace it with red char
hi clear OverLength
hi OverLength term=underline ctermfg=9 guifg=Magenta

" autocmd
autocmd FileType sh nnoremap <buffer> <C-b> i "${}"<ESC>hi
""autocmd VimResized * wincmd =
""let &winheight = &lines * 7 / 10
""let &winwidth = &columns * 7 / 10

"""Vim Mappings {{{
"""Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

"""Mapping for leader
let mapleader=","
"""Split Windows Mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
"""Misc mappings
nnoremap ; :
nnoremap <C-C> <C-V>
nnoremap j gj
nnoremap k gk
nnoremap <C-G><C-T> :tabe<CR>:ter ++curwin<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F4> :so $MYVIMRC<CR>
inoremap <C-F> <C-X><C-F>
"Save mappings
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>li
"Buffer mappings
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
"Tab mappings
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>
"""Plugin Mappings
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>; :Files<CR>
nnoremap <F6> :UndotreeToggle<CR>
nnoremap <Leader>v :Vista!!<CR>
"""}}}

"""Function {{{
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

"""s:LastBuffer Checks to see if any bufers is open that is NERDTree or
"""Vista or both, if so they are closed
function! s:LastBuffer()
    let l:winc = winnr('$')
    if(tabpagenr('$') == 1)
        if(l:winc == 1)
            let l:window = bufname(winbufnr('%'))
            if(l:window ==# t:NERDTreeBufName)
                :qall
            elseif(l:window ==# "__vista__" || vista#sidebar#IsOpen())
                :qall
            endif
        elseif(l:winc == 2)
            let l:window1 = bufname(winbufnr(1))
            let l:window2 = bufname(winbufnr(2))
            if(l:window1 == t:NERDTreeBufName && l:window2 ==# "__vista__")
                :qall
            endif
        endif
    endif
endfunction
autocmd bufenter * silent! call s:LastBuffer()

function! StatusGit() abort
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

function! StatusVista() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! StatusAle() abort
    let l:count = ale#statusline#Count(bufnr(''))
    let l:all_error = l:count.error + l:count.style_error
    let l:non_error = l:count.total - l:all_error
    return l:count.total == 0 ? 'OK' : printf('%dW %dE, %s', 
                \ l:non_error,
                \ l:all_error,
                \ ale#statusline#FirstProblem()) 
endfunction

function! s:TabLineEnable()
    g:tabline_enable = 1
endfunction

function! s:TabLineDisable()
    g:tabline_enable = 0
endfunction

function! s:TabLineAddBuffer()
    let 
endfunction
"""}}}
