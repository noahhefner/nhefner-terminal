" Noah Hefner
" Neovim config

" Plugins (using vim-Plug, https://github.com/junegunn/vim-plug)

call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dracula/vim',{'as':'dracula'}

call plug#end()

" Basic Settings

syntax enable
set hidden
set history=1000
set undofile
set undodir=$HOME/.vim/vimundo
set undolevels=1000
set termguicolors
set number
set scrolloff=12

" Color Settings

" colorscheme
color dracula

" background
set background=dark

" airline_theme
let g:airline_theme='base16_dracula'
