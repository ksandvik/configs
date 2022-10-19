" BASIC INITIAL COMMANDS

" Can't use fish from nvim just now (not POSIX compliant)
set shell=/bin/zsh

" default tab formatting
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" space as mapleader - first key in multi-key commands (see below for leader
" key use.
let mapleader = "\<Space>"

" default encoding utf-8
set encoding=utf-8

" Map escape in Terminal
tnoremap <Esc> <C-\><C-n>
    
" jk as ESC
inoremap jk <Esc>
vnoremap jk <Esc>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Always center when moving 
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz

set backspace=2 " backspace over newlines

" STATE, UNDO
" Permanent undo
set undodir=~/.vimdid
set undofile

" FORMATTING
syntax on
set number " Enable line numbers
" set relativenumber " Enable relative line numbers

" FILES
map <C-p> :files<CR>

" TELESCOPE
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" quick save
nmap <leader>s :w<CR>

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
highlight ColorColumn ctermbg=235 guibg=#2c2d27
set colorcolumn=80 " colored column
set noshowmode

" VIMPLUG

" Install plugins.
" Use :PlugInstall to load in the plugins at runtime.
call plug#begin('~/.local/share/nvim/plugged')

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Brightscript
Plug 'entrez/roku.vim'

" show match number for incsearch
Plug 'osyo-manga/vim-anzu'

" Gitbranch
Plug 'itchyny/vim-gitbranch'

" Lightline 
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
	\ 'gitbranch': 'gitbranch#name'
      \ },
\ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Rust
Plug 'rust-lang/rust.vim'

" ripgrep
Plug 'jremmen/vim-ripgrep'
let g:rg_command = 'rg --vimgrep -S'

" Cheatsheet
Plug 'sudormrfbin/cheatsheet.nvim'

" Leap
Plug 'ggandor/leap.nvim'


" Initialize plugin system
call plug#end()

lua require('leap').add_default_mappings()

