set number
set relativenumber
set incsearch
set ignorecase
set hidden
set scrolloff=8
set encoding=UTF-8
syntax on

set laststatus=2
set noshowmode

set nocompatible              " be iMproved, required
filetype off                  " required

" Installing Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin part starts

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'

" Plugin part ends
call vundle#end()            " required
filetype plugin indent on    " required

" Non-plugin part starts here.

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Bright',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ] 
      \	},
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \
      \ }


