"FROM: http://stevelosh.com/blog/2010/09/coming-home-to-vim/#important-vimrc-lines
filetype off
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set modelines=0

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

"Shorhortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

