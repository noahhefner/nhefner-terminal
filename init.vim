" Noah Hefner
" Neovim config

" Plugins (using vim-Plug, https://github.com/junegunn/vim-plug)

call plug#begin(stdpath('data') . '/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dracula/vim'

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

" Mappings

nmap <F1> :NERDTreeToggle<CR>

" Plugin Settings

let g:deoplete#enable_at_startup = 1
