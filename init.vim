" BASIC INITIAL COMMANDS
" space as mapleader
let mapleader = "\<Space>"

" default encoding utf-8
set encoding=utf-8

" ; as :
nnoremap ; :

" Jump to start and end of line using the home row keys
map H ^
map L $

" Move by line
nnoremap j gj
nnoremap k gk

" STATE, UNDO
" Permanent undo
set undodir=~/.vimdid
set undofile

" FORMATTING
" get syntax
syntax on
set autoindent
set number " Show current absolute line

" FILES
map <C-p> :files<CR>

" BUFFERS
nmap <leader>; :buffers<CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" FOLDING
" Folding - always open up all folds when opening file
set foldmethod=indent
set foldlevel=20

" SEARCH
" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered 
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" GUI
set colorcolumn=80 " colored column
set mouse=a " enable mouse in terminal


" VIMPLUG
" Install vimplug
if !executable('curl')
    echomsg 'You have to install curl to install vim-plug or install vim-plug
            \ yourself following the guide on vim-plug git repository'
else
    let g:VIM_PLUG_PATH = stdpath('config') . '/autoload/plug.vim'
    if empty(glob(g:VIM_PLUG_PATH))
        echomsg 'Installing Vim-plug on your system'
        silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        augroup plug_init
            autocmd!
            autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        augroup END
    endif
endif
"}}

" Install plugins.
call plug#begin('~/.local/share/nvim/plugged')

" Brightscript
Plug 'entrez/roku.vim'

" show match number for incsearch
Plug 'osyo-manga/vim-anzu'

" Initialize plugin system
call plug#end()

