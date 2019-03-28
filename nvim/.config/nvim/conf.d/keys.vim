"space as leader
let mapleader=" "

"new tab
nmap <leader>n :$tabnew<CR>

"next tab
nmap <TAB> :tabnext<CR>
nmap <S-TAB> :tabprevious<CR>


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

set pastetoggle=<F2>
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
cnoremap <C-o> <Space><C-h>
cnoremap q qa


command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!


inoremap <F5> "=strftime("%a, %Y-%m-%d")<CR>P
inoremap <F6> "=strftime("%a, %Y-%m-%d %H:%M")<CR>P

noremap <BS> :Lex<CR>

map <c-q> :FZF <CR>
"" Tab and Shift-Tab will cycle thorough parameters.
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Leader guide configuration.
let g:lmap =  {}
call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

let g:lmap.k = {
      \'name': 'PhpActor',
      \'b': ['call phpactor#ClassExpand()', 'ExpandClass'],
      \'c': ['call phpactor#CopyFile()', 'Copy file'],
      \'d': ['call phpactor#GotoDefinition()', 'Go to definition'],
      \'e': ['call phpactor#mxtractMethod()', 'Extract method'],
      \'f': ['call phpactor#FindReferences()', 'Find references'],
      \'k': ['call phpactor#ContextMenu()', 'Menu'],
      \'h': ['call phpactor#Hover()', 'Hover'],
      \'i': ['call phpactor#ClassInflect()', 'Inflect'],
      \'l': ['call phpactor#ClassNew()', 'New class'],
      \'m': ['call phpactor#MoveFile()', 'Move file'],
      \'n': ['call phpactor#Navigate()', 'Navigate'],
      \'t': ['call phpactor#Transform()', 'Transform/Complete'],
      \'u': ['call phpactor#UseAdd()', 'UseAdd'],
      \}

