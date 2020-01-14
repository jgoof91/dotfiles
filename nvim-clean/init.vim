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
set background=dark
colorscheme solarized
filetype plugin indent on

set termguicolors
set tabstop=4 softtabstop=4 expandtab smarttab autoindent
set ruler laststatus=2 showcmd showmode
set wrap breakindent
set encoding=utf-8
set number relativenumber
set splitbelow  splitright
set title

"""Highlight for Pmenu
highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermbg=gray gui=bold

"""Python settings
au BufNewFile, BufRead *.py
        \ set textwidth=79
        \ set fileformat=unix

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

"""Ultisnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsEditSplit = "vertical"


"""
let &winheight = &lines * 7 / 10
"""autocmd VimResized * wincmd =
"""autocmd WinEnter * resize:let &winheight = &lines * 7 / 10

"""Mapping for leader
let mapleader="\<SPACE>"
"""Split Windows Mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-R> <C-W><C-R>

"""Plugin Mappings
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap ; :Files<CR>
