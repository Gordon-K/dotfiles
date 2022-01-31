" =============================================================================
"  _   _                 _
" | \ | | ___  _____   _(_)_ __ ___
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
" | |\  |  __/ (_) \ V /| | | | | | |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|
" 
" =============================================================================

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
  " Plugins to install
  Plug 'morhetz/gruvbox'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()

set nocompatible              " Disable compatibility to old-time vi
set number                    " Show line numbers
set tabstop=2                 " Set tab to 2 spaces
set autoindent                " Auto indent
set shiftwidth=2              " Set autoindent to 2 spaces
set softtabstop=2             " Match multiple spaces to tabstops
set expandtab                 " Convert tabs to spaces
set showmatch                 " Show matching words
set ignorecase                " Case insensitive
set hlsearch                  " Highlight search
set incsearch                 " Incremental search
set cc=80                     " Set column border to 80 characters
set mouse=v                   " Middle click paste
set mouse=a                   " Enable mouse click
set noswapfile                " disable creating swap file

syntax enable
filetype plugin indent on

" Color schemes
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme gruvbox

" nvim-colorizer
" https://www.chrisatmachine.com/Neovim/10-adding-color/
" lua require'plug-colorizer'

" indent-blankline
" https://github.com/lukas-reineke/indent-blankline.nvim
" lua require'indentation'

" vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
