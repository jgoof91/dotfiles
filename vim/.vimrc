set modelines=0 nomodeline nocompatible
filetype plugin indent on

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
call plug#end()

syntax on

set termguicolors
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set smarttab 
set autoindent
set ruler 
set laststatus=2 
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
set undolevels=1000 
set history=1000 
set visualbell 
set noerrorbells
set path+=** 
set wildmenu
set colorcolumn=
set t_Co=256
"set textwidth=80 

if has('win64') || has('win32')     
        set backspace=indent,eol,start     
        set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe     
        set shellcmdFlag=-command     
        set shellquote=\"     
        set shellxquote= 
endif

if has('unix')     
    set background=dark
    colorscheme solarized 
    hi clear OverLength
    hi OverLength term=underline ctermfg=9 guifg=Magenta 
endif 

"""NERDTree
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='solarized'

"""Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_alwways_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
"Python
let g:syntastic_python_checkers = ['flake8', 'python']
"Shell
let g:syntastic_sh_shellcheck_exec = 'shellcheck'
"""let g:syntastic_sh_shellcheck_args = '-e 2064,2086,2139,2155'

"""SuperTab
let g:SuperTabDefaultCompletionType = '<C-n>'

"""YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_server_keep_log = 1
let g:ycm_server_log_level = 'debug'

"""Ultisnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsEditSplit = "vertical"

"""Highlight for Pmenu
highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermbg=gray gui=bold

"Clear the over 80 char red highligths and replace it with red char
hi clear OverLength
hi OverLength term=underline ctermfg=9 guifg=Magenta 

autocmd VimResized * wincmd =
let &winheight = &lines * 7 / 10
let &winwidth = &columns * 7 / 10

"""Mapping for leader
let mapleader="<SPACE>"
"""Split Windows Mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap ; :
nnoremap <C-C> <C-V>
nnoremap j gj
nnoremap k gk
inoremap <C-F> <C-X><C-F>
nnoremap <C-G><C-T> :tabe<CR>:ter ++curwin<CR>
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F4> :so $MYVIMRC<CR>

"""Plugin Mappings
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap ; :Files<CR>
