
" INIT COMMANDS
" space as mapleader
let mapleader = "\<Space>"

" FORMATTING
" get syntax
syntax on
set number " Show current absolute line

" FILES
" map <C-p> :Files<CR>

" BUFFERS
nmap <leader>; :Buffers<CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" FOLDING
" Folding - always open up all folds when opening file
set foldmethod=indent
set foldlevel=20

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



