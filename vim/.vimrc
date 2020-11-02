set modelines=0 nomodeline

"Plug.vim Plugins {{{
if plug#begin('~/.vim/plugged')
        Plug 'scrooloose/nerdcommenter'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-endwise'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb'
        Plug 'jiangmiao/auto-pairs'
        Plug 'AndrewRadev/splitjoin.vim'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'airblade/vim-gitgutter'
        Plug 'w0rp/ale'
        Plug 'liuchengxu/vista.vim'
        Plug 'puremourning/vimspector'
        Plug 'Yggdroot/indentLine', {'on': 'IndentLinesEnable'}
        "Lsp
        Plug 'natebosch/vim-lsc'
        "Colors
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
set undodir=~/.vim/undo
set nobackup
set nowb
set noswapfile
"set textwidth=80
set background=dark
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
colorscheme gruvbox
set t_Co=256
set termguicolors
set colorcolumn=80
if has('gui_running')
    set guioptions-=e
endif
"}}}
" Highline {{{
highlight! Normal guibg=None guifg=None
highlight! Search gui=underline guibg=#ebdbb2 guifg=#282828
highlight! TabLine gui=NONE guibg=#3c3836 guifg=#d5c4a1
highlight! TabLineSel gui=underline guibg=#a89984 guifg=#282828
highlight! Pmenu gui=NONE guibg=#504945 guifg=#fe8019
highlight! PmenuSel gui=bold guibg=#3c3836 guifg=#fe8019
highlight! User1 guibg=#3c3836 guifg=#bdae93
highlight! User2 guibg=#3c3836 guifg=#cc241d

"Clear the over 80 char red highligths and replace it with red char
hi clear OverLength
" }}}
" Statusline and Tabline {{{
"                            BACKGROUND  FOREGROUND
let g:mode_map = {
    \ 'n': ['NORMAL',        ['#7c6f64', '#282828']],
    \ 'v': ['VISUAL',        ['#fe8019', '#1d2021']],
    \ 'V': ['V-LINE',        ['#fe8019', '#1d2021']],
    \ "\<C-V>": ['V-BLOCK',  ['#fe8019', '#1d2021']],
    \ 's': ['SELECT',        ['#8ec07c', '#1d2021']],
    \ 'S': ['S-LINE',        ['#8ec07c', '#1d2021']],
    \ "\<C-S>": ['S-BLOCK',  ['#8ec07c', '#1d2021']],
    \ 'i': ['INSERT',        ['#83a598', '#1d2021']],
    \ 'R': ['REPLACE',       ['#b8bb26', '#1d2021']],
    \ 'Rv': ['V-REPLACE',    ['#b8bb26', '#1d2021']],
    \ 'c': ['COMMAND',       ['#d3869b', '#1d2021']],
    \ 'cv': ['VIM-EX',       ['#3c3836', '#1d2021']],
    \ 'ce': ['EX',           ['#3c3836', '#1d2021']],
    \ 'r': ['PROMPT',        ['#3c3836', '#1d2021']],
    \ 'rm': ['MORE',         ['#3c3836', '#1d2021']],
    \ 'r?': ['CONFIRM',      ['#3c3836', '#1d2021']],
    \ '?': ['SHELL',         ['#3c3836', '#1d2021']],
    \ 't': ['TERMINAL',      ['#98971a', '#1d2021']],
    \ }

set statusline=
set statusline+=%#StatusLine1#\ %{StatusMode()}
set statusline+=\ %1*%{StatusPaste()}
set statusline+=%{StatusBranch()}
set statusline+=\ %{StatusGit()}
set statusline+=\ %2*%{StatusAle()}
set statusline+=\ %1*%{StatusVista()}
set statusline+=%=%y\ [%{&fenc}]\ [%{&ff}]\ %#StatusLine2#[line:%l/%L\ col:%c
set statusline+=\ %p]
set tabline=%!TabAndBufLine()

function! StatusPaste() abort
    
    return &paste!=#""?" PASTE":""
endfunction

function! StatusMode() abort
    let [l:bg,l:fg] = g:mode_map[mode()][1]
    exe 'hi! StatusLine1 gui=bold guibg=' . l:bg . ' guifg=' . l:fg
    exe 'hi! StatusLine2 guibg=' . l:bg . ' guifg=' . l:fg
    return g:mode_map[mode()][0]
endfunction

function! StatusBranch() abort
	let l:h = FugitiveHead()
	if(l:h !=# "")
		return "[" . l:h . "]"
    else
		return ""
	endif
endfunction

function! StatusGit() abort
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('[+%d ~%d -%d]', a, m, r)
endfunction

function! StatusVista() abort
    let l:v = get(b:, 'vista_nearest_method_or_function', '')
    return l:v !=# '' ? '[' . l:v . ']' : ''
endfunction

function! StatusAle() abort
    let l:count = ale#statusline#Count(bufnr(''))
    let l:all_error = l:count.error + l:count.style_error
    let l:non_error = l:count.total - l:all_error
    if(l:count.total != 0)
        return printf('[%dW %dE, %s]',
                    \ l:non_error,
                    \ l:all_error,
                    \ ale#statusline#FirstProblem(bufnr('%'), 'E')
                    \ )
    else
        return ''
    endif

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

function! TabAndBufLine() abort
    let l:s=''
    if tabpagenr('$') > 1
        let l:items = s:TabLine()
    else
        let l:items = s:BufLine()
    endif
    for l:i in range(3)
        if(l:i == 1)
            let l:s .='%#TabLineSel#'
        else
            let l:s .='%#TabLine#'
        endif
        for l:ii in l:items[l:i]
            if exists("l:ii")
                let l:s .= l:ii . ' '
            else
                continue
            endif
        endfor
    endfor
    return l:s . '%#TabLineFill#'
endfunction
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
" Split Window Resize
nnoremap <LEADER>+ <C-W><C-+>
nnoremap <LEADER>- <C-W><C-->
nnoremap <LEADER>< <C-W><C-<>
nnoremap <LEADER>> <C-W><C->>
"Buffer mappings
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>
"Tab mappings
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>
" Make
nnoremap <LEADER>m :make<CR>
" Terminal
if has('nvim')
    nnoremap <Leader>t :tabe<BAR>:ter<CR>
else
    nnoremap <Leader>t :tabe<CR>:ter ++curwin<CR>
endif
" Misc mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <silent><F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F4> :so $MYVIMRC<CR>
noremap <C-F> <C-X><C-F>
"}}}
" NETRW {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 30
let g:netrw_altv = 0
nnoremap <LEADER>f :Vexplore<CR>
nnoremap <LEADER>F :Hexplore<CR>
nnoremap <LEADER><C-f> :Explore<CR>
augroup NETRW_GROUP
    au!
    au VimEnter * if(argc() == 0) | exe ':Vexplore' | wincmd l | endif
    au BufEnter * if(winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') ==# 'netrw') | exe ':q' | endif
augroup END
" }}}
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
"LSC {{{
let g:lsc_auto_map = v:true
let g:lsc_server_commands = {
            \ 'c': 'clangd-9',
            \ 'cpp': 'clangd-9',
            \ 'objc': 'clangd-9',
            \ 'objcpp': 'clangd-9',
            \ 'python': 'pyls',
            \ }
let g:lsc_autocomplete_length = 1
augroup LSC_PCLOSE
    au!
    au CompleteDone * silent! pclose
augroup END
"}}}
"Ale {{{
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"}}}
"Vista {{{
nnoremap <silent><Leader>v :Vista!!<CR>
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
augroup INDENT_LINE_ENABLE
    au!
    autocmd vimenter * IndentLinesEnable
augroup END
let g:indentLine_enabled = 1
let g:indentLine_color_term = 190
let g:indentLine_color_gui = '#616161'
let g:indentLine_char = '|'
"}}}
"FZF {{{
nnoremap <silent><Leader>; :Files<CR>
"}}}
"Function {{{
"}}}
" Autocmd {{{
augroup MISC_AUGROUP
    autocmd!
    autocmd BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END
"autocmd VimResized * wincmd =
"let &winheight = &lines * 7 / 10
"let &winwidth = &columns * 7 / 10
"}}}
