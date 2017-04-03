set nocompatible
syntax enable
filetype plugin indent on

source ~/.config/nvim/conf.d/plugins.vim

source ~/.config/nvim/conf.d/general.vim

source ~/.config/nvim/conf.d/keys.vim

source ~/.config/nvim/conf.d/misc.vim



if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>



"forhtmlonly!!!
"inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
"


source /home/awen/.config/nvim/conf.d/helpers.vim

"" Maps additional php extensions
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif
