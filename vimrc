" KS MAIN VIMRC FILE

" VIM PLUG PLUGINS
call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'

call plug#end()

" FORMATTING
syntax on
"set bs=4
set ts=4
set sw=4
set showmatch
set ai
set cindent shiftwidth=4
set showcmd
set ch=2
set backspace=indent,eol,start
set autoindent
set nocompatible
set number
set numberwidth=4

" MISC
set viminfo='20,\"50
set undolevels=500
set history=100
set hidden
set wildmenu
set showcmd
set shortmess=a
filetype on
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set clipboard+=unnamedplus
set ttyfast

" COLORING
"colo morning
"colo blue
" my color
" colo evening
" colo peachpuff
"colo taqua

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase
highlight Search term=reverse ctermbg=2
highlight Search guibg=LightBlue
highlight Search term=reverse

"AUTOCOMMANDS
"autocmd FileType * set formatoptions=tcql nocindent comments&
autocmd BufRead *.txt set tw=78

" MAPPINGS
map Q qg
inoremap jj <Esc>

" Jump to start and end of line using the home row keys
map H ^
map L $

" ABBREVIATIONS
abbr #i #include
abbr #d #define

" FUNCTION KEY BINDINGS
  " results of perl -cw into a new window
  map <D-1> :!/usr/bin/perl -cw % > ~/.vimtmp 2>&1<CR>:new<CR>:edit ~/.vimtmp<CR><CR>
  " close current window (^Ww to swap between them)
  map <D-2> :close<CR>
  " results of current perl script into a new window
  map <D-3> :!/usr/bin/perl % > ~/.vimtmp 2>&1<CR>:new<CR>:edit ~/.vimtmp<CR><CR>
  " results of current perl script into a new window
  map <D-4> :!/usr/bin/perl -d % <CR><CR>
  " next and previous key bindings
  map <f5> :cprevious <CR>
  map <f6> :cnext <CR>
  " format lines
  map <C-J> gqap
  " Explore function
  map <D-0> :Explore  <CR>
  " cinkeys to handle perl better
  set cinkeys=0{,0},:,!^F,o,O,e

  set rtp+=/opt/homebrew/opt/fzf

"==== gvimrc ====
  " set the font to use
  " set guifont=-adobe-courier-medium-r-*-*-12-*-*-*-*-*-*-*
  set gfn=Courier:h11

  " Let Windows process the Alt-key
  "set winaltkeys
  set mousehide

" cursor hilight
highlight Cursor guibg=Green guifg=NONE


" default window size and position

"winpos 200 20
"winsize 100 80
