set nocompatible            " disable compatibility to old-time vi
set mouse=v                 " middle-click paste with 


" Search
set hlsearch                " highlight search 
set incsearch               " incremental search
set showmatch               " show matching 
set ignorecase              " case insensitive 
set smartcase               " smart case setting
set gdefault                " graphics default

" Editor settings

set tabstop=3               " number of columns occupied by a tab 
set softtabstop=3           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=3            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set smartindent             " smart indent
set number                  " add line numbers
" set relativenumber        " enable relative numbers (if interest)
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style


filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set scrolloff=2		    " keep lines below cursor when scrolling
set sidescrolloff=5         " keep lines below cursor when scrolling
set encoding=utf-8          " for foreign languages
inoremap jj <Esc>        " jk as ESC
vnoremap jj <Esc>         " jk as ESC
set shell=/bin/zsh          " can't use fish from nvim just now (not POSIX compliant)
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

let mapleader = "\<Space>"   " space as command key
nmap <leader>s :w            " space s -> save
nmap <leader>; :buffers<CR>  " show buffers


" GUI
colorscheme lunaperche       " use colorscheme <tab> to see all colorschemes
set termguicolors            " activate color
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=80           " colored column
set noshowmode


