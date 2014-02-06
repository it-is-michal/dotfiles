"==============================================================================
" My .vimrc rewritten from scratch on  2012-10-11
"==============================================================================
" Notes to myself
" -----------------------------------------------------------------------------
" checkout plugins:
"  * MiniBufExplorer
"  * Command-t
"  * Syntastic
"  * flake8
"  * Snipmate
"  * Fugitive
"  * NerdCommenter
"  * Tagbar
"  * SimplePairs


"==============================================================================
" General options
"==============================================================================
set nocompatible "quite obvious
syntax on "syntax hilighting

" Map vimrc edit and vimrc source to a handy shortcut
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>

set mouse=a "enable mouse
set bs=2 "make backspace behave 'less magically' and more predictably

set clipboard=unnamed "easier integration with system clipboard

let mapleader = " " "rebind <Leader> key to space

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
Bundle 'bling/vim-airline'
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_theme = 'understated'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
map <Leader>f :NERDTreeToggle<CR>
"" Bundle 'L9'
"" Bundle 'FuzzyFinder'
Bundle 'tpope/vim-fugitive'
" Mercurial wrapper for Vim:
Bundle 'ludovicchabant/vim-lawrencium'
Bundle 'mhinz/vim-signify'

Bundle 'davidhalter/jedi-vim'

Bundle 'mileszs/ack.vim'

" colorschemes
"" Bundle 'vividchalk.vim'
"" Bundle "altercation/vim-colors-solarized"
Bundle 'chriskempson/base16-vim'

set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
if has('gui_running')
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  " remove scrollbars
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  " set font
  set guifont=Source\ Code\ Pro\ 11

  colorscheme base16-solarized
  set background=light
else
  colorscheme slate
  set background=dark
endif

" ctrlp
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
Bundle 'kien/ctrlp.vim'
map <Leader>l :CtrlPBuffer<CR>
map <Leader>p :CtrlP<CR>
map <Leader>n :tabnext<CR>
map <Leader>b :tabprevious<CR>
let g:ctrlp_max_height = 30
let g:ctrlp_open_multiple_files = 'i'
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*

" python-mode
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
Bundle 'klen/python-mode'
map <Leader>g :call RopeGoToDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_syntax_all = 1
" force python-mode to ignore warnings:
"  * E702 - numtilple statements in one line (BREAKPOINTs)
let g:pymode_lint_ignore = "E702"

" Better navigating through omnicomplete option list
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
   if pumvisible()
       if a:action == 'j'
           return "\<C-N>"
       elseif a:action == 'k'
           return "\<C-P>"
       endif
   endif
   return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


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
filetype plugin on
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

" easier block indenting - does not loose selection after indenting
vnoremap < <gv
vnoremap > >gv


"==============================================================================
" Visiual options
"==============================================================================
set number "show line numbers
set relativenumber "toggle relative line numbering
set tw=79 "sets width of document (used by gd)
set nowrap "don't automatically wrap on load
set fo-=t "don't automatically wrap text when typing
set hlsearch
set laststatus=2 "always show statusline - required for Powerline to show up

" TODO check out why code below does not work as expected
"" " highlight columns 81+
"" if has("colorcolumn")
""    set colorcolumn=80
"" else
""    au BufWinEnter * let w:m2=matchadd('WarningMsg', '\%>80v.\+', -1)
"" endif
set colorcolumn=80

" ==============================================================================
" Helper functions
" ==============================================================================
" Adjust GUI font size
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 48
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()


"==============================================================================
" Shortcuts and mappings
"==============================================================================
" Toggle spellcheck
nnoremap <Leader>s :set spell!<CR>
" Toggle paste mode with <F2>
set pastetoggle=<F2>
" toggle cursorcolumn and cursorline cross
noremap <Leader>x <esc>:set cuc!<cr>:set cul!<cr>
" toggle whitespace listing
noremap <Leader>ws :set list!<CR>
nnoremap <F7> :w<CR>
inoremap <F7> <ESC>:w<CR>i

" Python goodies
"------------------------------------------------------------------------------
map <Leader>B oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>
map <Leader>N oimport pudb; pudb.set_trace()  # BREAKPOINT<C-c>

" Remap arrows to <nop>
"------------------------------------------------------------------------------
"" map <up> <nop>
"" map <down> <nop>
"" map <left> <nop>
"" map <right> <nop>
"" imap <up> <nop>
"" imap <down> <nop>
"" imap <left> <nop>
"" imap <right> <nop>

" Move tabs
"------------------------------------------------------------------------------
" move left
nnoremap <Leader>h :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" move right
nnoremap <Leader>j :execute 'silent! tabmove ' . tabpagenr()<CR>
" move to the beggining
nnoremap <Leader>H :execute 'silent! tabmove 0'<CR>
" move to the end
nnoremap <Leader>J :execute 'silent! tabmove'<CR>
" new tab
nnoremap <Leader>t :tabnew<CR>

" Toggle line numbering
"------------------------------------------------------------------------------
function! g:ToggleLineNumberingMode()
    if(&relativenumber==1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <Leader>r :call g:ToggleLineNumberingMode()<CR>

" Adjust GUI font size
"------------------------------------------------------------------------------
nnoremap <Leader>- :SmallerFont<CR>
nnoremap <Leader>= :LargerFont<CR>

" Fast write and fast quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
