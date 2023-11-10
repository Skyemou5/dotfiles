call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'farmergreg/vim-lastplace'
call plug#end()

" additional plugin configuration
colorscheme dracula

" 'sets'
set number
set relativenumber
set tabstop=4
set expandtab
set shiftwidth=2
set autoindent
set wildmode=longest,list
syntax on
set showmatch
set cursorline
set smartcase
set hlsearch
set incsearch
set ttyfast

" mapping / bindings
inoremap jk <Esc>
