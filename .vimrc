set background=dark
syntax on
set encoding=utf-8

set autoindent
set smartindent
set copyindent
set number
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start " make backspace work like most other apps

" Show the cursor position at the end of the status line
set ruler

highlight LineNr ctermfg=grey " Set the line number color

" Stores undo info in a file so that it persists after vim closes
" Need to have ~/.vim/undo created
set undofile
set undodir=~/.vim/undo

set viminfo='20,<1000,s1000

