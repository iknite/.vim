""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @author: Enrique Paredes
" @version:0.1
"
" @description: 
"   Configuration options for macvim + terminal optimization. 
"
" @licensing:
"   Copyright ©2011 <MIT License>http://www.opensource.org/licenses/mit-license.php
"
" @resources&credits:
"   http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-line/
"   http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
"   :help
"   http://amix.dk/vim/vimrc.html
"   http://vimcasts.org/
"   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""GENERAL OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "Actally redundant, if you load ~/.vimrc (this file) is nocompatible mode
autocmd!
filetype off
call pathogen#runtime_append_all_bundles() "Every plugin is in ~/.vim/bundle/ folders
call pathogen#helptags()
filetype plugin indent on

"Indenting options
set ai "Auto ident
set si "smart Indent
" Only do this part when compiled with support for autocommands

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
if has("autocmd")
  " Enable file type detection
  filetype on
 
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)  
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set gfn=Menlo:h14
set number

"Search Options
set incsearch


""KEYBOARD OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader configuration
let mapleader = ","
let g:mapleader = ","

"Shorhortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Coloring Options
set background=dark 
colorscheme ir_black
syntax on

"Onmi Completion options
set ofu=syntaxcomplete#Complete

"Mouse Configuration
set mouse=a
set mousefocus

"Fullscreen
"set fullscreen

"Error managing
set visualbell
set errorbells

"Persistent undo
set undodir=.
set undofile 
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

