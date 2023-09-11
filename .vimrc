set number
set relativenumber
set incsearch
set ignorecase
set hidden
set scrolloff=8
set encoding=UTF-8
filetype on
filetype indent on
syntax on

set backspace=2
set backspace=indent,eol,start

set term=screen-256color

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

augroup vagrant
  au!
  au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType tf setlocal ts=2 sts=2 sw=2 expandtab

set background=dark
