set encoding=utf-8
" =================================
" Vundle Config
" =================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'   " https://github.com/VundleVim/Vundle.vim

" Utility plugins
Plugin 'preservim/nerdtree'     " https://github.com/preservim/nerdtree

" Programming plugins
Plugin 'Valloric/YouCompleteMe' " https://github.com/ycm-core/YouCompleteMe
Plugin 'universal-ctags/ctags'  " https://github.com/universal-ctags/ctags
Plugin 'majutsushi/tagbar'      " https://github.com/majutsushi/tagbar

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
set showcmd         " show command in bottom bar

" Show linenumbers
set number
set relativenumber

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

" =================================
" Plugin Config
" =================================
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YouCompleteMe
let g:ycm_max_num_candidates = 10
let g:ycm_auto_trigger = 2
let g:ycm_error_symbol = 'E!'
let g:ycm_warning_symbol = 'W!'
let g:ycm_semantic_triggers = {
        \   'c': [ 're!\w{2}' ]
        \ }

" =================================
" Mapping Config
" =================================
" NERDTree Toggle
map <C-n> :NERDTreeToggle<CR>
" Tagbar Toggle
map <C-m> :TagbarToggle<CR>
" Press F3 for timestamp like, 2016-01-25 Mo 12:44, at the cursor
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
