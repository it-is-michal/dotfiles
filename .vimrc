set nocompatible    " use vim defaults

"""""""""""""""""
" visual config "
"""""""""""""""""
syntax on
"colorscheme vividchalk " uncomment if you have colorschemes cloned
"set background=dark " same as above
set number " show line numbers
set ls=2            " allways show status line

set wildmenu " enable commands completition menu
set wildmode=list:longest,full

" highlight columns 81+
"if has("colorcolumn")
"   set colorcolumn=80
"else
"   au BufWinEnter * let w:m2=matchadd('WarningMsg', '\%>80v.\+', -1)
"endif
" or
set colorcolumn=80

set showmatch
set mouse=a " enable mouse

"""""""""""""
" indenting "
"""""""""""""
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4    " numbers of spaces to (auto)indent
set autoindent
set smartindent
set expandtab
set smarttab
set pastetoggle=<F2>    "toggle auto indentation for pasting

"""""""""""""""""""
" filetype plugin "
"""""""""""""""""""
filetype plugin on
filetype indent on
