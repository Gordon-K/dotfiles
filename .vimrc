" Kyle Gordon
"

" Colors {{{
syntax enable       " enable syntax processing
colorscheme badwolf " Use colorscheme ~/badwolf.vim
" }}}

" Spaces and Tabs {{{
set tabstop=8       " number of visual spaces per TAB
set softtabstop=0   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " The size of an 'indent' in spaces
set smarttab        " enabling this will make the tab key (in insert mode) insert spaces
" }}}

" UI Config {{{
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
" }}}

" Searching {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" }}}

" Shortcuts {{{
" Press F3 for timestamp like, 2016-01-25 Mo 12:44, at the cursor
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
" }}}