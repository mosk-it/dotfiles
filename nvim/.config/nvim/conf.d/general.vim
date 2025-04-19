set t_Co=256  " Set terminal to display 256 colors.
set background=dark
colorscheme Tomorrow-Night-Eighties


"set statusline+=%F\ %=%l/%L\ %p%%
set numberwidth=1
set lazyredraw
set wildmenu
set noreadonly " turn warning file RO offset noreadonly " turn warning file RO offset noreadonly " turn warning file RO offset noreadonly " turn warning file RO off
set cursorline
set mouse=
set clipboard=unnamedplus


set number 
set relativenumber

let &showbreak = '¬ '
set wrap
set cpo=naABceFs

set softtabstop=4
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hidden
set backspace=indent,eol,start

set ignorecase
set smartcase
set hlsearch
set incsearch

set laststatus=2

"splits
set splitbelow
set splitright
set viewoptions=cursor,folds,slash,unix
" timeout
set timeoutlen=400 ttimeoutlen=0

set shortmess=I


"spell
cnoreabbrev setspellpl setlocal spell spelllang=pl
cnoreabbrev setspellen setlocal spell spelllang=en
cnoreabbrev setnospell setlocal spell spelllang=

set showcmd ruler


"change hilight on insert mode
"autocmd InsertEnter * :set nornu nu | hi CursorLine cterm=none ctermbg=236 | hi CursorLineNr ctermfg=7
"autocmd InsertLeave * :set rnu nu | hi CursorLine cterm=none ctermbg=235 | hi CursorLineNr ctermfg=11

set sessionoptions=blank,curdir,folds,help,resize,slash,tabpages,unix,winpos,winsize 
set noequalalways 

" the minimal height of a window, when it's not the current window.
set winminheight=0 
" the minimal width of a window, when it's not the current window. 

set winminwidth=0 


set packpath=/usr/local/share/nvim/runtime,~/.local/share/nvim/site

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif



set shortmess+=A

" Backup {{{
set nobackup
set nowritebackup
set noswapfile
" }}}


let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
