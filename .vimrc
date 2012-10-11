"==============================================================================
" My .vimrc rewritten from scratch on  2012-10-11
"==============================================================================


"==============================================================================
" General options
"==============================================================================
set nocompatible "quite obvious
syntax on "syntax hilighting

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set mouse=a "enable mouse
set bs=2 "make backspace behave 'less magically' and more predictably

set clipboard=unnamed "easier integration with system clipboard

let mapleader = "," "rebind <Leader> key to comma

" disable backup files
set nobackup
set nowritebackup
set noswapfile
filetype off "required by Vundle

set history=700
set undolevels=700

set wildmenu " enable commands completition menu
set wildmode=list:longest,full

set showmatch


"==============================================================================
" Vundle settings
"==============================================================================
" Firstly you have to install vundle:
"   git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"==============================================================================
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle - required!
Bundle 'gmarik/vundle'

" my Vundles
"------------------------------------------------------------------------------
"" Bundle 'Lokaltog/vim-powerline'
"" Bundle 'scrooloose/nerdtree'
"" Bundle 'L9'
"" Bundle 'FuzzyFinder'
Bundle 'vividchalk.vim'
colorscheme vividchalk
set background=dark

" wombat256mod - colorscheme
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
"" Bundle 'michalbachowski/vim-wombat256mod'
"" set t_Co=256
"" color wombat256mod

" ctrlp
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
"" Bundle 'kien/ctrlp.vim'
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=**/coverage/*

" python-mode
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
"" Bundle 'klen/python-mode'
"" map <Leader>g :call RopeGoToDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0

" Better navigating through omnicomplete option list
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction
""
"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable


"==============================================================================
" Indentation
"==============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
filetype plugin indent on


"==============================================================================
" Movement, selection
"==============================================================================
" remap movement between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" remove hilight from search with <C-n>
noremap <C-n> :nohl<CR>
noremap <C-n> :nohl<CR>
noremap <C-n> :nohl<CR>

" easier block indenting - does not loose selection after indenting
vnoremap < <gv
vnoremap > >gv


"==============================================================================
" Visiual options
"==============================================================================
set number "show line numbers
set tw=79 "sets width of document (used by gd)
set nowrap "don't automatically wrap on load
set fo-=t "don't automatically wrap text when typing
set hlsearch
"" colorscheme slate "when not using vividchalk
"" set laststatus=2 "always show statusline - required for Powerline to show up

" TODO check out why code below does not work as expected
"" " highlight columns 81+
"" if has("colorcolumn")
""    set colorcolumn=80
"" else
""    au BufWinEnter * let w:m2=matchadd('WarningMsg', '\%>80v.\+', -1)
"" endif
set colorcolumn=80


"==============================================================================
" Shortcuts and mappings
"==============================================================================
" Toggle paste mode with <F2>
set pastetoggle=<F2>
" toggle cursorcolumn and cursorline cross
noremap <Leader>x <esc>:set cuc!<cr>:set cul!<cr>

" Python goodies
"------------------------------------------------------------------------------
map <Leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>
