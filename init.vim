" BASIC INITIAL COMMANDS
" space as mapleader
let mapleader = "\<Space>"

" default encoding utf-8
set encoding=utf-8

" KEY REMAPPINGS
" ; as :
nnoremap ; :
    
" jj as ESC
inoremap jj <Esc>
vnoremap jj <Esc>

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

" quick save
nmap <leader>w :w<CR>

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

" Install plugins.
call plug#begin('~/.local/share/nvim/plugged')

" Brightscript
Plug 'entrez/roku.vim'

" show match number for incsearch
Plug 'osyo-manga/vim-anzu'

" Lightline 
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
\ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction


" Initialize plugin system
call plug#end()

