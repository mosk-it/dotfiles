"space as leader
let mapleader=" "

"new tab
" nmap <leader>n :$tabnew<CR>

"next tab
" nmap <TAB> :tabnext<CR>
" nmap <S-TAB> :tabprevious<CR>


"<C-/> escape embedded terminal 
"tnoremap  <C-\><C-n>

"execute macro saved under q
nnoremap Q @q

inoremap <C-c> <ESC>

"make indent by one >
nmap > >>
nmap < <<


"standard mapping
nmap j gj
nmap k gk

nmap Y y$
vmap <CR> y

"handle master clipboard
nmap gp "*p
vmap gy "*y


nnoremap <leader>w :w<CR>

"nmap <S-k> :bprev<CR>
"nmap <S-j> :bnext<CR>



" command line readline like keybinding
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>
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

nmap <leader>a :nohlsearch<CR>
nmap <leader>q :bd<CR>
vmap r "_dP

nmap s <nop>
nmap S viWS
nmap s ysi

nmap '' viwS
nmap <leader>'' viWS


noremap <C-w>J <C-W>j<C-W>_
noremap <C-w>K <C-W>k<C-W>_
noremap <C-w>H <C-W>h<C-W>_
noremap <C-w>L <C-W>l<C-W>_


map <C-B> 15<C-Y>


nnoremap Q @q

inoremap <C-c> <ESC>
nmap j gj
nmap k gk

nmap > >>
nmap < <<

nmap Y y$
vmap <CR> y

nmap gp "*p
vmap gy "*y

"readline
imap <C-a> <C-O>^
imap <C-e> <C-O>$
imap <C-f> <C-O>l
imap <C-b> <C-O>h

nnoremap <leader>w :w<CR>

"nmap <S-k> :bprev<CR>
"nmap <S-j> :bnext<CR>



" console readline keybinding
cnoremap <C-p>  <Up>
cnoremap <C-n>  <Down>
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

nmap <leader>a :nohlsearch<CR>
nmap <leader>q :bd<CR>
vmap r "_dP

nmap s <nop>
nmap S viWS
nmap s ysi

nmap '' viwS
nmap <leader>'' viWS


map <C-J> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_


map <C-B> 15<C-Y>
map <C-F> 15<C-E>
vnoremap // y/<C-R>"<CR>

" disable command prompt edit
nmap q: <Nop>



"wildmenu selection - accept ctrl-k
cnoremap <C-o> <Space><C-h>

command! W :execute ':w suda://%'
" command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!


inoremap <F5> "=strftime("%a, %Y-%m-%d")<CR>P
inoremap <F6> "=strftime("%a, %Y-%m-%d %H:%M")<CR>P

map <c-q> :FZF <CR>


nmap <c-n> :bn<CR>
nmap <c-p> :bp<CR>

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = 'g<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:vim_markdown_auto_extension_ext = 'txt'





let g:vim_markdown_edit_url_in = '<leader>gl'
let g:vim_markdown_toc_autofit = 0



map <Plug> <Plug>Markdown_MoveToParentHeader
