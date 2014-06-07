""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @author: Enrique Paredes
" @version:0.1.7
"
" @description: 
"	Configuration options for macvim + terminal optimization. 
"
" @licensing:
"	Copyright ©2014 
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
set nocompatible              " be iMproved
" Bundle conf
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Custom Bundles
Bundle 'bling/vim-airline'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'wincent/command-t'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/nginx.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'chase/vim-ansible-yaml'
" EOF Custom bundles

filetype plugin indent on     " EOF Bundle conf

set autoread

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
set mouse=a "Mouse Configuration
set mousefocus
colorscheme Tomorrow-Night-Eighties
set colorcolumn=81
match ErrorMsg '\%<101v.\%>100v'
" Coloring Options
set background=dark 
set list!
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
set modeline
set modelines=5

"SEARCH OPTIONS
set incsearch
set smartcase

set foldmethod=manual
set foldnestmax=3

"Onmi Completion options
set ofu=syntaxcomplete#Complete

set hlsearch "Highlight search things
set wildignore=*.obj,*.exe,*.pyc,*.pyo,*.pyx,*.*~,*.sw* 

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Error managing
set visualbell
set errorbells

"delayed super cow powers
cmap w!! %!sudo tee > /dev/null %

"Persistent undo
set undodir=$HOME/.vim/undo
set undofile 
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"no backups
set nobackup
set nowritebackup

set t_ti= t_te=

if has("autocmd")
	" When vimrc is edited, reload it
	autocmd! bufwritepost .vimrc source ~/.vim/.vimrc

	" help last-position-jump
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
		\	exe "normal! g`\"" | endif

	" Syntax of these languages is fuzzy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based my personal taste
	autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType python setlocal ts=4 sw=4 sts=4 expandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml

	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setl fen
	autocmd FileType javascript setl nocindent
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

	" Leave the return key alone when in command line windows, since it's used
	" to run commands there.
	autocmd! CmdwinEnter * :unmap <cr>
	autocmd! CmdwinLeave * :call MapCR()
endif

function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

if has("gui_running") " Graphical editor running
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	if has("gui_gtk2")
		set guifont=Source\ Code\ Pro\ Semibold\ 10,Droid\ Sans\ Mono\ 10
	else
		set guifont=Source\ Code\ Pro\ Semibold:h13,Monaco:h14
	end
	set linespace=-1
else
	set t_Co=256
endif


""KEYBOARD OPTIONS""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Leader configuration
let mapleader = ","
let g:mapleader = ","

""ARROW KEYS ARE UNACCEPTABLE"""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Shortcut to outside paste
nmap <leader>p "+p<CR>

"Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"rapid .vimrc edit
nmap <leader>v :edit ~/.vim/.vimrc<CR>
 
"tagbar toogle
nmap <leader>o :TagbarToggle <CR>

"NerdTree
nmap <leader>e :NERDTreeToggle <CR>

" Normalized shortcuts
map <C-s> :w<CR>
"map <C-w> :bd<CR>

" Close the current buffer
map <leader>d :bdelete!<CR>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Cycle throught buffers
map <C-j> :bn<cr>
map <C-k> :bp<cr>

imap <c-c> <esc>
nnoremap <leader><leader> <c-^>

" Smash escape
inoremap jk <Esc>
inoremap kj <Esc>

" cycle through errors
map <C-n> :ce<cr>
map <C-N> :cn<cr>

" sorry Ex commands bye bye
nnoremap ; :

" add some finger love to CommandT
map <C-a> :CommandTFlush <cr>\|:CommandT<cr>


function! InsertTabWrapper()
	" Indent if we're at the beginning of a line. Else, do completion.
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


""PLUGINS CONFIGURATION"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"CtrlP
let g:ctrlp_show_hidden=1

"syntastic
highlight SignColumn guibg=bg ctermbg=bg

let g:syntastic_check_on_open=0
let g:syntastic_error_symbol = '▸'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '§'
let g:syntastic_style_warning_symbol='~'

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:bufferline_echo=0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

