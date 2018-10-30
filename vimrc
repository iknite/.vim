"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @copyright: Enrique Paredes
" @licensing:
"    <MIT License>http://www.opensource.org/licenses/mit-license.php
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

filetype off
" Autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plug')

    Plug 'Lokaltog/vim-easymotion'

    Plug 'tpope/vim-surround'

    " Plug 'Shougo/neocomplete.vim'

    " Make Vim play nicely with iTerm 2 and tmux
    " Plug 'akracun/vitality.vim'


    Plug 'chase/vim-ansible-yaml'

    " Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
    Plug  'ConradIrwin/vim-bracketed-paste'

    " Plug 'davidhalter/jedi-vim'

    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
        let g:go_fmt_command = "goimports"
        autocmd FileType go nmap <leader>t  <Plug>(go-test)
        autocmd FileType go nmap <leader>b  <Plug>(go-build)
        autocmd FileType go nmap <leader>r  <Plug>(go-run)

    Plug 'joeytwiddle/vim-multiple-cursors'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
        nmap <C-p> :FZF --reverse --inline-info<cr>

    Plug 'mattn/emmet-vim'

    " Plug 'majutsushi/tagbar'
    "     map <leader>m :TagbarToggle<CR>

    Plug 'rking/ag.vim'

    Plug 'sheerun/vim-polyglot'

    Plug 'tomtom/tcomment_vim'

    Plug 'tpope/vim-fugitive'

    Plug 'tpope/vim-repeat'

    Plug 'tpope/vim-unimpaired'

    Plug 'bling/vim-airline'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_alt_sep = ''
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''
        let g:airline_powerline_fonts=1
        let g:bufferline_echo=0

    Plug 'godlygeek/tabular'
        inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
        function! s:align()
          let p = '^\s*|\s.*\s|\s*$'
          if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
            let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
            Tabularize/|/l1
            normal! 0
            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
          endif
        endfunction

    Plug 'Shougo/vimfiler.vim'
        let g:vimfiler_as_defaut_explorer = 1
        let g:vimfiler_safe_mode_by_default = 0
        map - :VimFiler<cr>
    
    Plug 'Shougo/Unite.vim'

    Plug 'w0rp/ale'
        let g:ale_sign_error = '▸'
        let g:ale_sign_warning = '⚠'
        let g:airline#extensions#ale#enabled = 1
        let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'go': ['gofmt', 'goimports']
        \}
        let g:ale_linters = {
        \   'python': ['flake8'],
        \   'go': ['golangci-lint']
        \}


call plug#end()
filetype plugin indent on
" EOF Plug conf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sane Defaults FTW!

syntax enable
set shortmess+=I

set autoread                                " Update when changed from outside
set autowriteall                            " Writes on file change
set autoindent                              " Indenting options
set smartindent
set ruler                                   " always show the cursor position
set ts=4 sts=4 sw=4 expandtab               " Default tab flavour
set smarttab
set laststatus=2                            " Always show status in bar
set nowrap

set backspace=indent,eol,start              " Normalize backspacing between os

" set mouse=a                                 " Mouse Configuration
" set mousefocus

colorscheme Tomorrow-Night-Eighties
set colorcolumn=120,80
match ErrorMsg '\%<131v.\%>130v'

set t_Co=256                                " Coloring Options
set background=dark 

hi Normal ctermbg=None
hi NonText ctermbg=None

set encoding=utf-8
set scrolloff=5
set sidescrolloff=5
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set nocursorline
set ttyfast
set number
set relativenumber
set nomodeline                              " disable commands inside files
set modelines=0

set ttimeout                                " Set time to check commands
set ttimeoutlen=100

set incsearch                               " Search Options
set smartcase

set display+=lastline

set foldmethod=indent
set foldnestmax=3
set foldlevel=99

set ofu=syntaxcomplete#Complete             " Onmi Completion options
" set complete-=i                             " disable onmi to search in current path

set hlsearch                                " Highlight search things
set wildignore=*.obj,*.exe,*.pyc,*.pyo,*.pyx,*.*~,*.sw*,node_modules,bower_components,coverage,__pycache__

set list
set listchars=tab:▸\ ,eol:¬,nbsp:⍽          " Use the nice symbols for tabstops and EOL

" set visualbell
" set errorbells
set undofile                                " Persistent undo
set undodir=$HOME/.vim/undo                 " folder to store changes
set undolevels=1000                         " changes that can be undone
set undoreload=10000                        " lines to save on a buffer reload

set nobackup                                " No backups, It should be in CVS.
set noswapfile
set nowritebackup

if has("autocmd")
    " When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/.vim/vimrc

    " help last-position-jump
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
        \    exe "normal! g`\"" | endif
    
    " start in a scratch buffer
    autocmd VimEnter * if empty(expand('%')) | set buftype=nofile | endif
    
    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml

    " Syntax of these languages is fuzzy over tabs Vs spaces
    autocmd FileType bash setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType cucumber setlocal ts=4 sw=4 sts=4 expandtab

    " Customizations 
    autocmd FileType html setlocal nowrap

    autocmd FileType netrw setl bufhidden=delete
    autocmd FileType netrw setl bufhidden=wipe
endif

 " Graphical editor running
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guifont=Hack
    set linespace=-1
endif

runtime! macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard Mappings

" enhance sometimes dumb fingers overriding ex commands
nnoremap ; :

" Ex mode hurts more times that it's useful
nnoremap Q <nop>

" Treat long lines as break lines (breaks relativenumber count)
" nmap j gj
" nmap k gk

"Leader configuration
let mapleader = ","
let g:mapleader = ","

" window management
nmap <leader>s <C-w>s<C-w>j
nmap <leader>v <C-w>v<C-w>l

" buffer cycling
nmap <C-j> :bn<cr>
nmap <C-k> :bp<cr>

"Shortcut to paste from outside vim
nmap <leader>p "+p<CR>

"rapid .vimrc edit
nmap <leader>V :edit ~/.vim/vimrc<CR>

" Normalized escape
imap <C-c> <esc>
imap <C-\> <esc>:w<CR>
map <C-\> <esc>:w<CR>

"delayed super cow powers
cmap w!! %!sudo tee > /dev/null %

" Close the current buffer
nmap <leader>d :bdelete!<CR>
nmap <leader>q :qall!<CR>

" Close all the buffers
nmap <leader>ba :1,300 bd!<cr>
nnoremap <leader><leader> <c-^>
