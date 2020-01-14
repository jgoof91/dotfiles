set modelines=0 nomodeline nocompatible
syntax on
filetype plugin indent on

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
set title 
set undolevels=1000 
set history=1000 
set visualbell 
set noerrorbells
set path+=** 
set wildmenu
"set textwidth=80 
set colorcolumn=

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $TERM == "tmux-256color"
    set t_Co=256
    colo light
endif

"Clear the over 80 char red highligths and replace it with red char
hi clear OverLength
hi OverLength term=underline ctermfg=9 guifg=Magenta 

"Resizing the the all panes 
let &winheight = &lines * 7 / 10
let &winwidth = &columns * 7 / 10

let mapleader=","
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
