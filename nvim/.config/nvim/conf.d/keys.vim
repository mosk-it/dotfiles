"space as leader
let mapleader=" "

"scroll screen 3 lines above search occurrence from top 
nnoremap n nzt3<C-y> 

"new tab
nmap <leader>n :$tabnew<CR>

"next tab
nmap <TAB> :tabnext<CR>
nmap <C-TAB> :tabprevious<CR>


"<C-/> escape embedded terminal 
tnoremap  <C-\><C-n>

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

nmap <S-k> :bprev<CR>
nmap <S-j> :bnext<CR>



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

set pastetoggle=<F2>
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

nmap <S-k> :bprev<CR>
nmap <S-j> :bnext<CR>



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

set pastetoggle=<F2>
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
cnoremap <C-k> <Space><BS>
cnoremap q qa


command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
