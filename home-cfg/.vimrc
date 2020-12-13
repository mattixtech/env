" VIM config for Vim 8.0+

" Set up plugins via vim-plug
call plug#begin('~/.vim/plugged')
" Ideavim compatible
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/argtextobj.vim'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-exchange'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'

" Other plugins
Plug 'itchyny/lightline.vim'
call plug#end()

" Plugin settings
let g:argtextobj_pairs="[:],(:),<:>"

" General settings
let mapleader=","
" set highlight to 500 ms
let g:highlightedyank_highlight_duration = 500

syntax on                   " syntax highlighting
filetype plugin indent on   " load filetype-specific indent files

set nocompatible            " don't emulate vi
set relativenumber          " relative line numbering
set number                  " absolute line numbering on current line
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set expandtab               " tabs are spaces
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set ttimeoutlen=50
set visualbell              " don't beep the bell
set encoding=utf-8          " use utf-8 encoding
set noshowmode
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" Add newlines with enter
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
