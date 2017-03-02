let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/py/gwshwd
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 gwschuj_cli/__init__.py
badd +1 gwschuj_cli/__pycache__/
badd +1 gwschuj_cli/app.py
badd +21 gwschuj_cli/config.py
badd +18 gwschuj_cli/convert.py
badd +1 gwschuj_cli/download.py
badd +1 gwschuj_cli/printer.py
badd +5 gwschuj_cli/scraper.py
badd +79 ~/.config/nvim/init.vim
argglobal
silent! argdel *
argadd gwschuj_cli/__init__.py
argadd gwschuj_cli/scraper.py
argadd gwschuj_cli/printer.py
argadd gwschuj_cli/download.py
argadd gwschuj_cli/convert.py
argadd gwschuj_cli/config.py
argadd gwschuj_cli/app.py
argadd gwschuj_cli/__pycache__/
set stal=2
edit gwschuj_cli/convert.py
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit gwschuj_cli/convert.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 23 - ((22 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 0
tabedit ~/.config/nvim/init.vim
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit ~/.config/nvim/init.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 18 - ((17 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 025|
tabnext 2
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOA
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
