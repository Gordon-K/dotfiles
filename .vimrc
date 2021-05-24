set encoding=utf-8

" =================================
" Vundle Config
" =================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Rust
Plugin 'rust-lang/rust.vim'

" Themes
Plugin 'morhetz/gruvbox'        " https://github.com/morhetz/gruvbox

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" =================================
" General Config
" =================================
set nowrap

" Show linenumbers
set number
set relativenumber

" Show cursorline
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline

" Set Proper Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " The size of an 'indent' in spaces
set smarttab        " enabling this will make the tab key (in insert mode) insert spaces

" Utility and search
set showmatch       " highlight matching [{()}]
set wildmenu        " visual autocomplete for command menu
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set path+=**

" Theme and Styling
syntax on
colorscheme gruvbox
set background=dark


