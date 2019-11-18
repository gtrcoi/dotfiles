" Show line numbers
set nu

" Forget vi compatibility, its 20xx
set nocompatible

" Enable syntac and plugins (for netrw)

if !exists("g:syntax_on")
    syntax enable
endif

filetype plugin on

" Enable recursive `find`
set path+=**

" Display all mathing files when we tab comple
set wildmenu

" Plugin manager
call plug#begin('~/.vim/plugged')

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'KabbAmine/vCoolor.vim'
call plug#end()
