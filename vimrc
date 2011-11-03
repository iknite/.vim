""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @author: Enrique Paredes
" @version:0.1
"
" @description: 
"	Configuration options for macvim + terminal optimization. 
"
" @licensing:
"	Copyright ©2011 <MIT License>http://www.opensource.org/licenses/mit-license.php
"
" @resources&credits:
"	http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-line/
"	http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
"	:help
"	http://amix.dk/vim/vimrc.html
"	http://vimcasts.org/
"	http://jonatkinson.co.uk/removing-toolbar-macvim/ 
"	
" @plugins:
"	[submodule "bundle/snipmate"]
"		path = bundle/snipmate
"		url = https://github.com/msanders/snipmate.vim.git
"	[submodule "bundle/surround"]
"		path = bundle/surround
"		url = https://github.com/tpope/vim-surround.git
"	[submodule "bundle/fugitive"]
"		path = bundle/fugitive
"		url = https://github.com/tpope/vim-fugitive.git
"	[submodule "bundle/nerdtree"]
"		path = bundle/nerdtree
"		url = https://github.com/scrooloose/nerdtree.git
"	[submodule "bundle/nerdcommenter"]
"		path = bundle/nerdcommenter
"		url = https://github.com/scrooloose/nerdcommenter.git
"	[submodule "bundle/minibufexpl.vim"]
"		path = bundle/minibufexpl.vim
"		url = https://github.com/fholgado/minibufexpl.vim.git 
"	[submodule "bundle/tagbar"]
"		path = bundle/tagbar
"		url = https://github.com/majutsushi/tagbar.git
"	[submodule "bundle/headlights"]
"		path = bundle/headlights
"		url = https://github.com/mbadran/headlights.git 
""	[submodule "bundle/xmledit"]
"		path = bundle/xmledit
"		url = https://github.com/sukima/xmledit.git
""	[submodule "bundle/pyflakes-vim"]
"		path = bundle/xmledit
"		url = https://github.com/kevinw/pyflakes-vim.git
"	[submodule "bundle/javaScriptLint.vim"]
"		path = bundle/javaScriptLint.vim
"		url = https://github.com/joestelmach/javaScriptLint.vim.git
"	svn co "bundle/languagetool"
"		path = bundle/languagetool
"		url = https://languagetool.svn.sourceforge.net/svnroot/languagetool/trunk/JLanguageTool
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""GENERAL OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 
autocmd!
call pathogen#runtime_append_all_bundles() "Every plugin is in ~/.vim/bundle/ folders
call pathogen#helptags()
filetype plugin indent on

"Indenting options
set ai "Auto ident
set si "smart Indent
" Only do this part when compiled with support for autocommands

set ruler " show the cursor position all the time
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
syntax on

if has("autocmd")

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)  
	autocmd FileType html setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml

	" When vimrc is edited, reload it
	autocmd! bufwritepost vimrc source ~/.vim/vimrc
endif

" Graphical editor running
if has("gui_running")

	" Coloring Options
	set background=dark 
	set transparency=12
	set fu
	colorscheme ir_black

	set guioptions-=T
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
set gfn=Monaco:h11
set number

"SEARCH OPTIONS
set incsearch


"JAVASCRIPT SECTION"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

set foldmethod=indent
set foldnestmax=3

""KEYBOARD OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader configuration
let mapleader = ","
let g:mapleader = ","

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"rapid Vim/gvim edit
nmap <leader>v :edit ~/.vim/vimrc<CR>
nmap <leader>V :edit ~/.vim/gvimrc<CR>
 
"tagbar toogle
nmap <leader>o :TagbarToggle <CR>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>d :bdelete<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Onmi Completion options
set ofu=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"Mouse Configuration
set mouse=a
set mousefocus

"set fullscreen "Fullscreen

set hlsearch "Highlight search things

"Error managing
set visualbell
set errorbells

"Persistent undo
set undodir=.
set undofile 
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
