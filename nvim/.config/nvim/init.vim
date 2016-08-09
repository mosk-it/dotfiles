set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.nvim/plugged')

"Must have
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'rking/ag.vim'
Plug 'tommcdo/vim-exchange'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-repeat'
Plug 'ap/vim-buftabline'
Plug 'jreybert/vimagit'
Plug 'scrooloose/syntastic'
Plug 'tmhedberg/matchit'


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"DEV

Plug 'itchyny/vim-gitbranch'
Plug 'tacahiroy/ctrlp-funky'


Plug 'rstacruz/vim-closer'
"Plug 'StanAngeloff/php.vim.git'

Plug 'vim-scripts/mru.vim'
Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'EvanDotPro/php_getset.vim', {'for': 'php'}
Plug 'm2mdas/phpcomplete-extended-symfony', {'for': 'php'}
"Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}

"Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'ap/vim-css-color', {'for': 'css'}
Plug 'evidens/vim-twig', {'for': 'twig'}
Plug 'HTML-AutoCloseTag', {'for': 'html'}



"test
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wincent/terminus'
Plug 'junegunn/vim-peekaboo'
Plug 'jistr/vim-nerdtree-tabs'


Plug 'Shougo/unite.vim'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
"Plug 'tpope/vim-fugitive'


"Plug 'jiangmiao/auto-pairs'
"Plug 'vim-scripts/simple-pairs.git'
"Plug 'chase/vim-ansible-yaml.git'
"Plug 'vim-scripts/closetag.vim.git'
"Plug 'spf13/vim-autoclose.git'
"Plug 'spf13/PIV.git'
"Plug 'm2mdas/phpcomplete-extended'
"Plug 'bronson/vim-trailing-whitespace'
"Plug 'airblade/vim-gitgutter'
"Plug 'sjbach/lusty'
"Plug 'Shougo/vimfiler.vim'
"Plug 'tpope/vim-obsession'
"Plug 'taglist.vim'
"Plug 'vimwiki/vimwiki'
"Plug 'junegunn/goyo.vim'
"Plug 'php.vim'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

filetype plugin indent on


let mapleader=" "
set wildmenu
set lazyredraw

autocmd BufEnter * set mouse=

nmap j gj
nmap k gk

nmap <silent> <F3> :NERDTreeToggle<CR>

set cursorline

au BufEnter * set noro " turn warning file RO off


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
set rnu
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

nmap <S-k> :bprev<CR>
nmap <S-j> :bnext<CR>


command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

:map Q <Nop>


" gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"let g:phpcomplete_index_composer_command="/usr/bin/composer"
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

set completeopt=menuone,longest,preview


"set clipboard=unnamedplus
set clipboard+=unnamedplus
set smartcase
set ignorecase
set ic
set hlsearch


nmap <leader>a :nohlsearch<CR>
nmap <leader>q :bd<CR>


vmap r "_dP


noremap ,, ;
noremap ,> ,


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

"let g:SuperTabDefaultCompletionType = "<c-n>"
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

"set timeout
"set timeoutlen=750
"set ttimeoutlen=250

"NeoVim handles ESC keys as alt+key set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif


let g:lightline = { 'colorscheme': 'jellybeans' }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'ctrlpmark', 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [  'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileencoding', 'filetype' ] ] }

let g:lightline.component_function = {
      \   'ctrlpmark': 'CtrlPMark',
      \   'gitbranch': 'gitbranch#name'
      \ }


function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction



let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


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


" do not show stupid popup window 
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

let g:SuperTabDefaultCompletionType = "context"

map <C-B> 15<C-Y>
map <C-F> 15<C-E>


set viewoptions=cursor,folds,slash,unix

noremap <leader>r :%s:::g<Left><Left><Left>
noremap <leader>R :%s:::cg<Left><Left><Left><Left>

vnoremap // y/<C-R>"<CR>
    
let g:syntastic_always_populate_loc_list = 1 " allows navigate to error via :ll
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']


let php_var_selector_is_identifier = 1
