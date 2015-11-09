set nocompatible
filetype plugin on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'StanAngeloff/php.vim.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree.git'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nanotech/jellybeans.vim.git'
Plugin 'kien/ctrlp.vim.git'
"Plugin 'fholgado/minibufexpl.vim.git'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'vim-scripts/simple-pairs.git'
"Plugin 'chase/vim-ansible-yaml.git'
"Plugin 'vim-scripts/closetag.vim.git'
Plugin 'vim-scripts/mru.vim.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'EvanDotPro/php_getset.vim.git'
Plugin 'evidens/vim-twig.git'
Plugin 'mbbill/undotree.git'
Plugin 'tpope/vim-surround'
"Plugin 'ap/vim-buftabline'
"Plugin 'spf13/vim-autoclose.git'
"Plugin 'spf13/PIV.git'
Plugin 'Shougo/neocomplete.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'ervandew/supertab'
Plugin 'paulyg/Vim-PHP-Stuff'
Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'rking/ag.vim'
"Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'HTML-AutoCloseTag'
"Plugin 'edkolev/tmuxline.vim'
"Plugin 'itchyny/lightline.vim'
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'sjbach/lusty'
"Plugin 'bling/vim-bufferline'
"Plugin 'Shougo/vimfiler.vim'
Plugin 'mhinz/vim-signify'
Plugin 'ap/vim-css-color'
Plugin 'tommcdo/vim-exchange'
Plugin 'taglist.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'm2mdas/phpcomplete-extended-symfony'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-obsession'
Plugin 'vim-scripts/Solarized'
Plugin 'sjl/badwolf'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-sleuth'

call vundle#end()
filetype plugin indent on

let mapleader=" "
set wildmenu
set lazyredraw


nmap j gj
nmap k gk

nmap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <F6> :UndotreeToggle<cr>

set cursorline

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']


let g:vim_markdown_folding_disabled=1
set nofoldenable

nmap ; :
set noswapfile
hi Directory guifg=#FF0000 ctermfg=red
:syntax on
set incsearch
set t_Co=256  " Set terminal to display 256 colors.
set nu
set background=dark
"colorscheme solarized
colorscheme jellybeans
set softtabstop=4
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartcase
set hidden

noremap <leader>h ^
noremap <leader>l $
noremap <leader>H 0

imap <C-a> <C-O>^
imap <C-e> <C-O>$
imap <C-f> <C-O>l
imap <C-b> <C-O>h

nnoremap <leader>w :w<CR>
nmap <S-k> :bprevious<CR>
nmap <S-j> :bnext<CR>

cmap w! w !sudo tee > /dev/null %

"let g:nerdtree_tabs_open_on_console_startup=1
"let g:miniBufExplorerAutoStart = 1
"let g:miniBufExplBuffersNeeded = 1
"set noequalalways
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let g:phpcomplete_index_composer_command="/usr/bin/composer"
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

set completeopt=menuone,longest,preview


set clipboard=unnamedplus
set smartcase
set ignorecase
set ic
:set hlsearch


:nmap <leader>q :nohlsearch<CR>


vmap r "_dP


"let g:unite_source_history_yank_enable = 1
"try
  "let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  "call unite#filters#matcher_default#use(['matcher_fuzzy'])
"catch
"endtry
"" search a file in the filetree
"nnoremap <leader>e :<C-u>Unite -start-insert file_rec/async<cr>
"nnoremap <leader>f :<C-u>Unite buffer<cr>
"" reset not it is <C-l> normally
":nnoremap <leader>r <Plug>(unite_restart)


nnoremap <leader>f :<C-u>CtrlPBuffer<cr>
nnoremap <leader>g :<C-u>CtrlP<cr>

" --- type ° to search the word in all files in the current dir
nmap <leader>? :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <leader>/ :Ag

set pastetoggle=<F2>

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

let g:SuperTabDefaultCompletionType = "<c-n>"
set laststatus=2


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$\|cache\|cache$\|cache/\|\*/cache/\*\|vendor$',
  \ 'file': '\.exe$\|\.so$\|\.dat$|\.so$\|\.tpl\.php$'
  \ }


let g:ctrlp_max_files=0

let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings'  }

let g:ctrlp_buffer_func = { 'enter': 'CtrlPMappings' }

let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

function! CtrlPMappings()
  nnoremap <buffer> <silent> <C-w> :call <sid>DeleteBuffer()<cr>
endfunction
 
function! s:DeleteBuffer()
  let path = fnamemodify(getline('.')[2:], ':p')
  let bufn = matchstr(path, '\v\d+\ze\*No Name')
  exec "bd" bufn ==# "" ? path : bufn
  exec "norm \<F5>"
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#show_close_button = 0


set timeoutlen=1000 
set ttimeoutlen=0

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

function! AirlineInit()
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline#extensions#whitespace#checks = [  ]
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#bufferline#enabled = 0
endfunction
autocmd VimEnter * call AirlineInit()


"TAGLIST

let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1

nnoremap <silent> <F8> :TlistToggle<CR>


" Pushing current line up and down
nnoremap <leader>k ddkP
nnoremap <leader>j ddp

" pushes word under the cursor to the left & to the right
nnoremap <leader>mh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o><C-l>:nohlsearch<CR>
nnoremap <leader>ml "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><C-o>/\w\+\_W\+<CR><C-l>:nohlsearch<CR>


" Expanded visual selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" No cursorline while in insert mode
"autocmd InsertEnter * set nocursorline
"autocmd InsertLeave * set cursorline

" do not showstupid popup window 
map q: :q

" timeout
set timeoutlen=300 ttimeoutlen=0

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

au FocusLost * :set number
au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertEnter * :set norelativenumber

autocmd InsertLeave * :set rnu
autocmd InsertLeave * :set nu


function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>n :call NumberToggle()<cr>

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'


map <C-J> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_


"splits
set splitbelow
set splitright

