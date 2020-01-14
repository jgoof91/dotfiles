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
