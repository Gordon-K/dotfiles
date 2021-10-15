set number
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

set termguicolors

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'norcalli/nvim-colorizer.lua'

" Initialize plugin system
call plug#end()

" gruvbox
colorscheme gruvbox

" nvim-colorizer
" https://www.chrisatmachine.com/Neovim/10-adding-color/
lua require'plug-colorizer'

