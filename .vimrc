" vi: set foldmethod=marker :
"==============================================================================
" My .vimrc rewritten from scratch on  2012-10-11
"==============================================================================
set nocompatible "quite obvious

set shell=/bin/bash

"==============================================================================
" Plugins managed via Vundle {{{
"==============================================================================
" Firstly you have to install vundle:
"   git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"==============================================================================
filetype off "required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle - required!
Bundle 'gmarik/vundle'

" my Vundles
"------------------------------------------------------------------------------
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-markdown'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'ludovicchabant/vim-lawrencium'
"Bundle 'mhinz/vim-signify'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'jmcantrell/vim-virtualenv'
Bundle 'lambdalisue/vim-pyenv'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'benmills/vimux'
Bundle 'sjl/badwolf'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'henrik/vim-indexed-search'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'fatih/vim-go'
Bundle 'elzr/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'mxw/vim-jsx'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'alvan/vim-closetag'
Bundle 'Townk/vim-autoclose'
Bundle 'bronson/vim-trailing-whitespace'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

"==============================================================================
" General options {{{
"==============================================================================
syntax on "syntax hilighting

let mapleader = " " "rebind <Leader> key to space

" Map vimrc edit and vimrc source to a handy shortcut
nnoremap <Leader>ve :vsplit $MYVIMRC<CR>
nnoremap <Leader>vs :source $MYVIMRC<CR>

" Map <F1> to <esc>
nnoremap <F1> <esc>
inoremap <F1> <esc>
vnoremap <F1> <esc>

" Map j and k rocker <esc> shortcuts
inoremap jk <esc>
inoremap kj <esc>

set mouse=a "enable mouse
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set bs=2 "make backspace behave 'less magically' and more predictably

set clipboard=unnamed "easier integration with system clipboard

" disable backup files
set nobackup
set nowritebackup
set noswapfile

set history=700
set hidden
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set wildmenu " enable commands completition menu
set wildmode=list:longest,full

set showmatch
set incsearch

set diffopt+=vertical

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

set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/htmlcov/*

" Python folding
" borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

" }}}

"==============================================================================
" Pungins options {{{
"==============================================================================
" fugitive
nnoremap <leader>b :Gblame<CR>

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.html, *.js, *.jsx"

" bling/vim-airline -----------------------------------------------------------
"let g:airline#extensions#virtualenv#enabled = 1
let g:airline_theme = 'murmur'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" scrooloose/nerdtree ---------------------------------------------------------
map <Leader>f :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', 'htmlcov']

" davidhalter/jedi-vim --------------------------------------------------------
let g:jedi#completions_enabled = 0
let g:jedi#use_tabs_not_buffers = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" SirVer/ultisnips ------------------------------------------------------------
"function! g:UltiSnips_Complete()
    "call UltiSnips#ExpandSnippet()
    "if g:ulti_expand_res == 0
        "if pumvisible()
            "return "\<C-n>"
        "else
            "call UltiSnips#JumpForwards()
            "if g:ulti_jump_forwards_res == 0
               "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"" this mapping Enter key to <C-y> to chose the current highlight item
"" and close the selection list, same as other IDEs.
"" CONFLICT with some plugins like tpope/Endwise
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" benmills/vimux --------------------------------------------------------------
nnoremap <F5> :call VimuxRunLastCommand()<CR>
nnoremap <F6> :VimuxPromptCommand<CR>

" rking/ag.vim ----------------------------------------------------------------
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>
" bind K to grep word under cursor
nnoremap KK :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" kien/ctrlp.vim --------------------------------------------------------------
nnoremap <Leader>p :CtrlPBuffer<CR>
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_open_multiple_files = 'i'

" use ag instead of vim's grep
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-agignore="$(git rev-parse --show-toplevel)/.gitignore" -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings' }

function! CtrlPMappings()
  nnoremap <buffer> <silent> <C-@> :call <sid>DeleteBuffer()<cr>
endfunction

function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction

" klen/python-mode ------------------------------------------------------------
let g:pymode_rope = 0
let g:pymode_folding = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_syntax_all = 1
" force python-mode to ignore warnings:
"  * E702 - numtilple statements in one line (BREAKPOINTs)
let g:pymode_lint_ignore = "E702"

" }}}

"==============================================================================
" Indentation {{{
"==============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
filetype plugin on
filetype plugin indent on
" }}}

"==============================================================================
" Movement, selection {{{
"==============================================================================
" remap movement between windows
"" let g:tmux_navigator_no_mappings = 1
""
"" nnoremap <silent> <ctrl-h> :TmuxNavigateLeft<cr>
"" nnoremap <silent> <ctrl-j> :TmuxNavigateDown<cr>
"" nnoremap <silent> <ctrl-k> :TmuxNavigateUp<cr>
"" nnoremap <silent> <ctrl-l> :TmuxNavigateRight<cr>
"" nnoremap <silent> <ctrl-/> :TmuxNavigatePrevious<cr>

" remove hilight from search with <C-n>
noremap <Leader>nh :nohl<CR>
noremap <Leader><space> :nohl<CR>

" easier block indenting - does not loose selection after indenting
vnoremap < <gv
vnoremap > >gv
" }}}

"==============================================================================
" Visiual options {{{
"==============================================================================
set number "show line numbers
set relativenumber "toggle relative line numbering
set tw=79 "sets width of document (used by gd)
set nowrap "don't automatically wrap on load
set fo-=t "don't automatically wrap text when typing
set hlsearch
set laststatus=2 "always show statusline - required for Powerline to show up
set cursorline

" TODO check out why code below does not work as expected
"" " highlight columns 81+
"" if has("colorcolumn")
""    set colorcolumn=80
"" else
""    au BufWinEnter * let w:m2=matchadd('WarningMsg', '\%>80v.\+', -1)
"" endif
set colorcolumn=80

set t_Co=256

colorscheme badwolf

if has('gui_running')
  set guioptions-=m  " remove menu bar
  set guioptions-=T  " remove toolbar
  " remove scrollbars
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
  " set font
  set guifont=Source\ Code\ Pro\ 10
endif
" }}}

" ==============================================================================
" Helper functions {{{
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
" }}}

"==============================================================================
" Shortcuts and mappings {{{
"==============================================================================
nnoremap <Leader>gg :Ag! -i
nnoremap <Leader>hh :Ag! -w
nnoremap <leader>N yiw:Ag! -w <c-r>"<CR>
nnoremap <Leader>ll :Limelight
nnoremap <Leader>lo :Limelight!<CR>
nnoremap <Leader>g :Goyo<CR>  " enter Zen mode
" Toggle spellcheck
nnoremap <Leader>s :set spell!<CR>
" Toggle paste mode with <F2>
set pastetoggle=<F2>
" toggle cursorcolumn and cursorline cross
noremap <Leader>x <esc>:set cuc!<cr>
" toggle whitespace listing
noremap <Leader>ws :set list!<CR>
nnoremap <F7> :w<CR>
inoremap <F7> <ESC>:w<CR>i
noremap <F8> :cclose<CR>
inoremap <F8> :cclose<CR>
noremap <F9> :copen<CR>
inoremap <F9> :copen<CR>

" Python goodies
"------------------------------------------------------------------------------
map <Leader>BI oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>
map <Leader>BP oimport pudb; pudb.set_trace()  # BREAKPOINT<C-c>

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

" Tab and Buffers shortcuts
"------------------------------------------------------------------------------
" move between tabs
map <Leader>J :tabnext<CR>
map <Leader>K :tabprevious<CR>

map <Leader>j :bnext<CR>
map <Leader>k :bprevious<CR>

" move tab left
nnoremap <Leader>h :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
" move tab right
nnoremap <Leader>l :execute 'silent! tabmove ' . tabpagenr()<CR>
" move tab to the beggining
nnoremap <Leader>H :execute 'silent! tabmove 0'<CR>
" move tab to the end
nnoremap <Leader>L :execute 'silent! tabmove'<CR>
" create new tab
nnoremap <Leader>t :tabnew<CR>

" Toggle line numbering
"------------------------------------------------------------------------------
""function! g:ToggleLineNumberingMode()
""    if(&relativenumber==1)
""        set norelativenumber
""    else
""        set relativenumber
""    endif
""endfunc
""nnoremap <Leader>r :call g:ToggleLineNumberingMode()<CR>

" Adjust GUI font size
"------------------------------------------------------------------------------
nnoremap <Leader>- :SmallerFont<CR>
nnoremap <Leader>= :LargerFont<CR>

" Fast write, quit, and edit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>bd :bd<CR>

nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>sh :split<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
" }}}

"==============================================================================
" Autocommands {{{
"==============================================================================
augroup restructuredtext
    autocmd FileType rst set foldmethod=marker
    " Shortcuts for RST headers
    autocmd FileType rst nnoremap <buffer> <leader>1 yypVr=o<esc>
    autocmd FileType rst nnoremap <buffer> <leader>2 yypVr-o<esc>
    autocmd FileType rst nnoremap <buffer> <leader>3 yypVr~o<esc>
    autocmd FileType rst nnoremap <buffer> <leader>4 yypVr.o<esc>

    " Shortcut for creating RST fold
    autocmd FileType rst nnoremap <buffer> <leader>cf `<O.. {{{<esc>`>o.. }}}<esc>k
augroup END

augroup markdown
    autocmd FileType markdown set foldmethod=expr
    autocmd FileType markdown nnoremap <buffer> <leader>1 yypVr=o<esc>
    autocmd FileType markdown nnoremap <buffer> <leader>2 yypVr-o<esc>
augroup END

augroup xml
    autocmd FileType xml nnoremap <buffer> <leader>y :% !xmllint --format -<esc>
augroup END

augroup python
    autocmd FileType python nnoremap <buffer> <leader>rt :call VimuxRunCommand("clear; py.test -s --flakes --pep8 " . @%)<CR>
    autocmd FileType python nnoremap <buffer> <leader>rat :call VimuxRunCommand("clear; py.test -s --flakes --pep8")<CR>
augroup END

augroup javascript
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set softtabstop=2
    autocmd FileType javascript set shiftwidth=2
    autocmd FileType javascript set shiftround
    autocmd FileType javascript set expandtab
    autocmd FileType javascript set foldmethod=indent
    autocmd FileType javascript set foldnestmax=2
augroup END

augroup css
    autocmd FileType css set tabstop=2
    autocmd FileType css set softtabstop=2
    autocmd FileType css set shiftwidth=2
    autocmd FileType css set shiftround
    autocmd FileType css set expandtab

    autocmd FileType scss set tabstop=2
    autocmd FileType scss set softtabstop=2
    autocmd FileType scss set shiftwidth=2
    autocmd FileType scss set shiftround
    autocmd FileType scss set expandtab
augroup END

autocmd BufWinEnter * silent! :%foldopen!
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
" }}}
