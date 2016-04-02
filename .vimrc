set background=dark
syntax on
set number
set encoding=utf-8

set ts=4 " number of spaces in a tab
set sw=4 " number of spaces for indent
set et   " expand tabs into spaces

set backspace=indent,eol,start " make backspace work like most other apps

" Show the cursor position at the end of the status line
set ruler

" Stores undo info in a file so that it persists after vim closes
" Need to have ~/.vim/undo created
set undofile
set undodir=~/.vim/undo
