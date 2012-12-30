""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @author: Enrique Paredes
" @version:0.5
"
" @description: 
"	Configuration options for macvim + terminal optimization. 
"
" @licensing:
"	Copyright ©2011 
"	<MIT License>http://www.opensource.org/licenses/mit-license.php
"
" @resources&credits:
"	http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-line/
"	http://vimcasts.org/e/27
"	:help
"	http://amix.dk/vim/vimrc.html
"	http://vimcasts.org/
"	http://jonatkinson.co.uk/removing-toolbar-macvim/ 
"	"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""GENERAL OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 
autocmd!
call pathogen#runtime_append_all_bundles() "Every plugin is in ~/.vim/bundle/ 
call pathogen#helptags()
"call pathogen#infect()
filetype plugin indent on

"Indenting options
set ai "Auto ident
set si "smart Indent

set ruler " show the cursor position all the time
set ts=4
set sw=4
set sts=4
set noexpandtab
set laststatus=2
syntax on

if has("autocmd")
	" When vimrc is edited, reload it
	autocmd! bufwritepost vimrc source ~/.vim/vimrc

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)  
	autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType python setlocal ts=2 expandtab sw=2 sts=2

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	
	"JAVASCRIPT SECTION"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setl fen
	autocmd FileType javascript setl nocindent
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	"autocmd FileType javascript inoremap <buffer> $r return
	"autocmd FileType javascript inoremap <buffer> $f //--- PH -----------------
endif

if has("gui_running") " Graphical editor running
	set guioptions-=T
	colorscheme ir_black
	set guifont=Liberation\ Mono:h12,Monaco:h12
	"set colorcolumn=100
	match ErrorMsg '\%>100v.\+'
	set transparency=6
	set mouse=a "Mouse Configuration
	set mousefocus
else
	colorscheme ir_black
	colorscheme blackboard
endif

" Coloring Options
set background=dark 
"set fu "fullscreen mode

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set number

"SEARCH OPTIONS
set incsearch
set smartcase

set foldmethod=indent
set foldnestmax=3

""KEYBOARD OPTIONS""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader configuration
let mapleader = ","
let g:mapleader = ","

"Shortcut to outside paste
nmap <leader>p "+gP<CR>

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"rapid Vim/gvim edit
nmap <leader>v :edit ~/.vim/vimrc<CR>
 
"tagbar toogle
nmap <leader>o :TagbarToggle <CR>

"NerdTree
nmap <leader>e :NERDTreeToggle <CR>

"CommandT Flush
nmap <leader>T :CommandTFlush <CR>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Normalized shortcuts
map <C-s> :w<CR>
"map <C-w> :bd<CR>

" Close the current buffer
map <leader>d :bdelete<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Cycle throught buffers
map <C-j> :bn<cr>
map <C-k> :bp<cr>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Onmi Completion options
set ofu=syntaxcomplete#Complete

set hlsearch "Highlight search things

"Error managing
set visualbell
set errorbells

"Persistent undo
set undodir=.
set undofile 
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

let g:syntastic_javascript_checker= "gjslint"
let g:syntastic_javascript_gjslint_conf = "--strict --ignore_errors=110,200"


