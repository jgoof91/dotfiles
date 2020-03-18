set modelines=0 nomodeline nocompatible

"Plug.vim Plugins {{{
silent! if plug#begin('~/.vim/plugged')
        Plug 'scrooloose/nerdtree'
        Plug 'scrooloose/nerdcommenter'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-endwise'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb'
        Plug 'jiangmiao/auto-pairs'
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
        endif
        Plug 'prabirshrestha/async.vim'
        Plug 'prabirshrestha/vim-lsp'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'
        Plug 'prabirshrestha/asyncomplete-file.vim'
        if has('python3')
            "Plug 'python-mode/python-mode'
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
            Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
            " Plug 'thomasfaingnaert/vim-lsp-snippets'
            " Plug 'thomasfaingnaert/vim-lsp-ultisnips'
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
"}}}
"Basic Settings {{{
filetype plugin indent on
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set ruler
set laststatus=2
set showtabline=2
set tabline=
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
set ignorecase
set smartcase
set title
set undolevels=10000
set history=10000
set visualbell
set noerrorbells
set path+=**
set wildmenu
set wildignore=*.o,*~,*.pyc
set hidden
set backspace=indent,eol,start
set noshowmode
set undofile
set undodir='~/.vim/undo'
set nobackup
set nowb
set noswapfile
"set textwidth=80
set background=dark
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
try
    colorscheme gruvbox
catch
    try
        colorscheme gruvbox
    catch
    endtry
endtry
set t_Co=256
set termguicolors
set colorcolumn=80
"let g:solarized_termcolors=256
if has('gui_running')
    set guioptions-=e
endif
"}}}
"Platform Settings {{{
if has('win64') || has('win32')
    set shell=C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe
    "set shellcmdFlag=-command
    set shellquote=\"
    set shellxquote=
endif

if has('unix')
    hi clear OverLength
    hi OverLength term=underline ctermfg=9 guifg=Magenta
endif
"}}}
"Mappings {{{
"Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

"Mapping for leader
let mapleader=","
"Split Windows Mappings
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
"Misc mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <silent><C-G><C-T> :tabe<CR>:ter ++curwin<CR>
nnoremap <silent><F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <silent><F4> :so $MYVIMRC<CR>
inoremap <C-F> <C-X><C-F>
"Save mappings
nnoremap <silent><C-s> :w<CR>
nnoremap <silent><C-S> :wa<CR>
inoremap <silent><C-s> <ESC>:w<CR>li
"Quit mappings
nnoremap <silent><C-q> :q<CR>
nnoremap <silent><C-Q> :qa<CR>
"Buffer mappings
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
"Tab mappings
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>
"}}}
"Startup for Startify and NERDTree {{{
augroup StartifyNerdtree
    autocmd StdinReadPre * let s:std_in = 1
    autocmd VimEnter * nested if !argc() && !exists('s:std_in') | silent! Startify | silent! NERDTree | wincmd p | endif
    "autocmd VimEnter * silent! NERDTree | wincmd p
augroup END
"}}}
"Startify {{{
let g:startify_bookmarks = ['~/.vimrc', '~/.bashrc', '~/.profile', '~/.aliasrc']
let g:startify_change_to_dir = 1
"}}}
"NERDTree {{{
let NERDTreeIngore = ['\.pyc$', '\.pyo$', '__pycache__$', '\.gitingore']
let NERDTreeWinSize = 30
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '<'
nnoremap <silent> <Leader>f :NERDTreeToggle<CR>
"}}}
"NERDCommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
"}}}
"Lightline {{{
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \ 'left': [['mode', 'paste'], ['git-branch', 'git-gutter']],
            \ 'right': [['lineinfo'], ['percent'],
            \ ['fileformat', 'fileencoding', 'filetype'], ['ale-error'], ['vista']]
            \ },
            \ 'tabline': {
            \ 'left': [['tabandbufline']],
            \ 'right': [[]]
            \ },
            \ 'component_function': {
            \ 'git-branch': 'fugitive#head',
            \ 'git-gutter': 'StatusGit',
            \ 'ale-error': 'StatusAle',
            \ 'vista': 'StatusVista'
            \ },
            \ 'component_expand': {
            \ 'tabandbufline': 'TabAndBufLine'
            \ },
            \ 'component_type': {
            \ 'tabandbufline': 'tabsel'
            \ }
            \ }

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
                \ ale#statusline#FirstProblem(bufnr('%'), 'E')
                \ )
endfunction

function! s:BufName(buf)
    let l:name = bufname(a:buf)
    if l:name == ''
        let l:name = '[No Name]'
    else
        let l:name = fnamemodify(l:name, ':p')
        let l:name = pathshorten(l:name)
    endif
    if getbufvar(a:buf, '&mod')
        let l:name .= '+'
    elseif getbufvar(a:buf, '&readonly') && !getbufvar(a:buf, 'modifiable') && getbufvar(a:buf, '&filetype') !=# 'help'
        let l:name .= '[RO]'
    endif
    return substitute(l:name, '%', '%%', 'g')
endfunction

function! s:BufNames(bufs, start, end)
    let l:names = []
    for l:i in range(a:start, a:end - 1)
        call add(l:names, s:BufName(a:bufs[l:i]))
    endfor
    return l:names
endfunction

function! s:BufLine()
    let l:bufs = filter(range(1, bufnr('$')), "bufexists(v:val) && buflisted(v:val) && !(getbufvar(v:val, '&filetype') ==# 'qf')")
    let l:cur = index(l:bufs, bufnr('%'))
    if l:cur == -1
        return [s:BufNames(l:bufs, 0, len(l:bufs)), [], []]
    endif
    let l:before = s:BufNames(l:bufs, 0, l:cur)
    let l:current = s:BufNames(l:bufs, l:cur, l:cur + 1)
    let l:after = s:BufNames(l:bufs, l:cur + 1, len(l:bufs))
    return [l:before, l:current, l:after]
endfunction

function! s:TabLine()
    let l:tabc = tabpagenr('$')
    let l:cur = tabpagenr()
    let l:before = []
    let l:current = []
    let l:after = []
    for l:i in range(1,l:tabc)
        let l:buflist = tabpagebuflist(l:i)
        if l:i < l:cur
            call add(l:before, s:BufName(l:buflist[0]))
        elseif l:i == l:cur
            call add(l:current, s:BufName(l:buflist[0]))
        else
            call add(l:after, s:BufName(l:buflist[0]))
        endif
    endfor
    return [l:before, l:current, l:after]
endfunction

function! TabAndBufLine()
    if tabpagenr('$') > 1
        return s:TabLine()
    else
        return s:BufLine()
    endif
    return [[],[],[]]
endfunction
"}}}
"Ale {{{
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"}}}
"Vista {{{
nnoremap <silent><Leader>v :Vista!!<CR>
"}}}
"UndoTree {{{
nnoremap <silent><F6> :UndotreeToggle<CR>
"}}}
"Python-mode {{{
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
"}}}
"Vim-lsp {{{
let g:lsp_diagnostics_enabled = 0
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
if executable('clangd-9')
    " Install clangd-9
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd']},
                \ 'whitelist': ['c', 'cpp']
                \ })
endif
"AsyncComplete-File
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'whitelist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))
" AsyncComplete-Ultisnip
if has('python3')
    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
                \ 'name': 'ultisnips',
                \ 'whitelist': ['*'],
                \ 'priority': 10,
                \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
                \ }))
endif
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    setlocal foldmethod=expr
                \ foldexpr=lsp#ui#vim#folding#foldexpr()
                \ foldtext=lsp#ui#vim#folding#foldtext()
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
    "refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    "call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
inoremap <C-Space> <Plug>(asyncomplete_force_refresh)
"}}}
"Ultisnips {{{
if has('python3')
    let g:UltiSnipsExpandTrigger = "<C-Tab>"
    let g:UltiSnipsJumpForwardTrigger = "<C-S-Tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<C-Down>"
    "let g:UltiSnipsEditSplit = "vertical"
endif
"}}}
"IndentLine {{{
autocmd vimenter * IndentLinesEnable
let g:indentLine_enabled = 1
let g:indentLine_color_term = 190
let g:indentLine_color_gui = '#616161'
let g:indentLine_char = '|'
"}}}
"FZF {{{
nnoremap <silent><Leader>; :Files<CR>
"}}}
"Function {{{
"s:LastBuffer Checks to see if any bufers is open that is NERDTree or
"Vista or both, if so they are closed
function! s:LastBuffer() abort
    let l:winc = winnr('$')
    if tabpagenr('$') == 1
        if l:winc == 1
            let l:window = bufname(winbufnr('%'))
            if l:window ==# t:NERDTreeBufName
                :qall
            elseif l:window ==# "__vista__" || vista#sidebar#IsOpen()
                :qall
            endif
        elseif l:winc == 2
            let l:window1 = bufname(winbufnr(1))
            let l:window2 = bufname(winbufnr(2))
            if l:window1 == t:NERDTreeBufName && 
                        \ l:window2 ==# "__vista__" &&
                        \ vista#sidebar#IsOpen()
                :qall
            endif
        endif
    endif
endfunction
autocmd bufenter * silent! call s:LastBuffer()
"}}}
"Misc {{{
highlight Pmenu guibg=brown gui=bold
highlight Pmenu ctermbg=gray gui=bold

"Clear the over 80 char red highligths and replace it with red char
hi clear OverLength
hi OverLength term=underline ctermfg=9 guifg=Magenta

"Autocmd
autocmd FileType sh nnoremap <buffer> <C-b> i "${}"<ESC>hi
autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"autocmd VimResized * wincmd =
"let &winheight = &lines * 7 / 10
"let &winwidth = &columns * 7 / 10
"}}}
