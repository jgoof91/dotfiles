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
set tabstop=4 softtabstop=4 expandtab smarttab autoindent                                                           
set ruler laststatus=2 showcmd showmode                                                                             
set wrap breakindent                                                                                                
set encoding=utf-8                                                                                                  
set number relativenumber                                                                                           
set splitbelow  splitright                                                                                          
set title                                                                                                           
                                                                                                                    
highlight Pmenu guibg=brown gui=bold                                                                                
highlight Pmenu ctermbg=gray gui=bold                                                                               
                                                                                                                    
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
                                                                                                                    
set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe\ -executionpolicy\ bypass^M                     
                                                                                                                    
let &winheight = &lines * 7 / 10                                                                                    
let mapleader="<SPACE>"                                                                                             
nnoremap <C-H> <C-W><C-H>                                                                                           
nnoremap <C-J> <C-W><C-J>                                                                                           
nnoremap <C-K> <C-W><C-K>                                                                                           
nnoremap <C-L> <C-W><C-L>                                                                                           
nnoremap <C-R> <C-W><C-R>                                                                                           
nnoremap <TAB> :NERDTreeToggle<CR>                                                                                  
