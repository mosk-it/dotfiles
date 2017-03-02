set nocompatible
filetype plugin on
syntax on


call plug#begin('~/.vim/plugged')


Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'nanotech/jellybeans.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim'
Plug 'HTML-AutoCloseTag'
Plug 'itchyny/lightline.vim'
Plug 'tommcdo/vim-exchange'
Plug 'terryma/vim-expand-region'
Plug 'sjl/badwolf'
Plug 'tpope/vim-sleuth'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-repeat'
Plug 'ap/vim-buftabline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'dahu/vimple'

call plug#end()

filetype plugin indent on


let mapleader=" "
set wildmenu
set lazyredraw

nmap j gj
nmap k gk

nmap <silent> <F3> :NERDTreeToggle<CR>
set cursorline
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:vim_markdown_folding_disabled=1
set nofoldenable

nmap ; :

set backup
set backupdir=/tmp
set dir=/tmp

hi Directory guifg=#FF0000 ctermfg=red

syntax on
set incsearch
set t_Co=256  " Set terminal to display 256 colors.
set nu
set rnu
set background=dark
set softtabstop=4
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smartcase
set hidden
colorscheme jellybeans

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

command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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


set clipboard=unnamedplus
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
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>


cnoremap <C-B> <C-O>^
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>


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

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'fileformat' ], [ 'syntastic', 'lineinfo' ], ['percent'], ['ctrlpmark'] ]
      \ },
      \ 'component_function': {
      \   'fileformat': 'LightLineFiletype',
      \   'readonly': 'LLReadonly',
      \   'modified': 'LLModified',
      \   'filename': 'LLFilename',
      \   'mode': 'LLMode',
      \ }
      \ }

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction


function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction



let g:vitality_fix_focus=0



function! LLModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LLReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "!"
  else
    return ""
  endif
endfunction

function! LLFilename()
  return ('' != LLReadonly() ? LLReadonly() . ' ' : '') .
       \ ('' != expand('%') ? expand('%') : '[No Name]') .
       \ ('' != LLModified() ? ' ' . LLModified() : '')
endfunction







function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

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

"au FocusLost * :set number
"au FocusGained * :set relativenumber

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

let s:save_cpo = &cpo

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>


set viewoptions=cursor,folds,slash,unix

noremap <leader>; :%s:::g<Left><Left><Left>
noremap <leader>' :%s:::cg<Left><Left><Left><Left>

vnoremap // y/<C-R>"<CR>
