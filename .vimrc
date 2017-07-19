""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   VIM Configuration File
"
" Author: Do Tuan Hung <dth.online@gmail.com>
" Date: July 14, 2017
"
" To use it, copy it to:
"   for Unix/Linux: ~/.vimrc
"      for Windows: %HOME%/.vimrc


"""""""""""""""""""""""""""""""""""""""
" General Settings

" Use vim settings rather than vi's (much better)
set nocompatible

" Default encoding is utf-8, en-US
set encoding=utf-8

" Unix as default file format
set ffs=unix,dos,mac

" Make backspace behave like it should
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

if has("autocmd")
  filetype plugin indent on   " Enable filetype detection and indentation
endif

set hidden

set nobackup  " Turn off backup
set nowb noswapfile

" Enable use of the mouse for all modes
set mouse=a


"""""""""""""""""""""""""""""""""""""""
" Convenient settings

" auto reload vimrc whenever it changes
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" set VIM's working directory to the current file
autocmd BufEnter * silent! :lcd%:p:h

" jj is Esc
inoremap jj <esc>

" Leader key
let mapleader = ","
let g:mapleader=","

" Fast saving
nmap <Leader>w :w!<CR>

nore ; :
nore , ;


"""""""""""""""""""""""""""""""""""""""
" UI Settings

" Color schemes
set background=dark   " dark background
if !has("gui_running")
    " enable 256 colors for VIM in ConEmu (cmder)
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme desert
endif

" show line numbers
set number

" show typing command and current mode in bottom bar
set showcmd showmode

" highlight current line
set cursorline
highlight CursorLine cterm=none ctermbg=18

" visual autocomplete for command menu
set wildmenu
set wildmode=list:longest,full

" redraw only when needed
set lazyredraw

" highlight matching braces
set showmatch


"""""""""""""""""""""""""""""""""""""""
" Formatting (tabs, indentation)

set expandtab         " use spaces for TAB
set tabstop=4         " number of visual spaces for TAB
set softtabstop=4     " number of spaces for TAB when editing
set shiftwidth=4      " number of spaces for indenting

set autoindent        " indent at the same level of the previous line
set smartindent


"""""""""""""""""""""""""""""""""""""""
" Search Settings

set incsearch     " search as you type
set hlsearch      " highlight search results
set ignorecase    " ignore case
set smartcase     " smart case (there is uppercase letter) matching
set magic         " turn magic on for regex


"""""""""""""""""""""""""""""""""""""""
" Status line

set laststatus=2      " always show a status line
set cmdheight=1       " the cmd line is 1 line high

hi User1 ctermbg=52 guifg=#ffdad8 guibg=#880c0e
hi User2 ctermbg=166 ctermfg=0 guifg=#000000 guibg=#F4905C
hi User3 ctermbg=226 ctermfg=233 guifg=#292b00 guibg=#f4f597
hi User4 ctermbg=47 ctermfg=234 guifg=#112605 guibg=#aefe78
hi User5 ctermbg=2 ctermfg=235 guifg=#051d00 guibg=#7dcc7d
hi User7 ctermbg=52 ctermfg=15 cterm=bold guifg=#ffffff guibg=#880c0e gui=bold
hi User8 ctermbg=25 ctermfg=15 guifg=#ffffff guibg=#5b7fbb
hi User9 ctermbg=54 ctermfg=15 guifg=#ffffff guibg=#810085
hi User0 ctermbg=54 ctermfg=15 guifg=#ffffff guibg=#094afe

" Format the status line
set statusline=
set statusline+=%7*\[%n]                              " Buffer No.
set statusline+=%1*\ %<%F\                            " File+path
set statusline+=%2*\ %y\                              " Filetype
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}  " Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}         " Encoding2
set statusline+=%4*\ %{&ff}\                          " Fileformat (dos/unix...)
set statusline+=%5*\ %{&spelllang}\ %{HasPaste()}\    " Spell lang & paste mode
set statusline+=%#error#%{StatuslineTabWarning()}%*
set statusline+=%8*\ %=\ r:%l\|%L\                    " Linenumber/total
set statusline+=%9*\ c:%c\                            " Col number
set statusline+=%0*\ \ %m%r%w\ %P\ \                  " Modified? Readonly? Top/bot.


"""""""""""""""""""""""""""""""""""""""
" Helper functions

" Return true if paste mode is enabled
function! HasPaste()
    if &paste
        return '[P]'
    else
        return ''
    endif
endfunction

" Return true if highlightsearch is enabled
function! HighlightSearch()
    if &hls
        return '[H]'
    else
        return '   '
    endif
endfunction

" recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

" return '[&et]' if &et is set wrong
" return '[mixed]' if spaces and tabs are used to indent
" return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction
