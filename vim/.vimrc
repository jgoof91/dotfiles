call plug#begin()                                                      
Plug 'scrooloose/nerdtree'                                             
Plug 'tpope/vim-surround'                                              
Plug 'tpope/vim-repeat'                                                
Plug 'terryma/vim-multiple-cursors'                                    
Plug 'airblade/vim-gitgutter'                                          
Plug 'altercation/vim-colors-solarized'                                
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' 
call  plug#end()                                                       
                                                                       
syntax on                                                              
filetype plugin indent on                                              
set nocompatible
set autoread
set tabstop=4 softtabstop=4 expandtab smarttab autoindent              
set ruler laststatus=2 showcmd showmode                                
set wrap breakindent                                                   
set encoding=utf-8                                                     
set number relativenumber                                              
set splitbelow splitright                                              
set hlsearch incsearch wildmenu                                        
set backspace=indent,eol,start                                         
set title                                                              
set path+=** wildmenu
                                                                       
highlight Pmenu guibg=brown gui=bold                                   
highlight Pmenu ctermbg=gray gui=bold                                  
                                                                       
autocmd VimResized * wincmd =                                          
                                                                       
au BufNewFile, BufRead *.py                                            
    \ set textwidth=79                                                 
    \ set fileformat=unix                                              
                                                                       
let NERDTreeShowHidden=1                                               
let g:NERDTreeDirArrowExpandable = '>'                                 
let g:NERDTreeDirArrowCollapsible = '<'                                
                                                                       
let g:airline#extensions#tabline#enabled = 1                           
let g:airline#extensions#tabline#left_sep = '|'                        
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'    
let g:airline#extensions#syntastic#enabled = 1                         
let g:airline_theme='solarized'                                        
                                                                       
let &winheight = &lines * 7 / 10  

let mapleader="<SPACE>"                                                
inoremap ^F ^X^F
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <F4> :so $MYVIMRC
nnoremap <C-H> <C-W><C-H>                                              
nnoremap <C-J> <C-W><C-J>                                              
nnoremap <C-K> <C-W><C-K>                                              
nnoremap <C-L> <C-W><C-L>                                              
nnoremap <C-R> <C-W><C-R>                                              
nnoremap <TAB> :NERDTreeToggle<CR>                                     
