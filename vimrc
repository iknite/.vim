"SOURCE http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-line/
"SOURCE http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

set nocompatible
autocmd!
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast

set incsearch

"Shorhortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

colorscheme darkrobot
