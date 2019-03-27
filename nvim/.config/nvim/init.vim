set nocompatible
syntax enable
filetype plugin indent on

source ~/.config/nvim/conf.d/plugins.vim

source ~/.config/nvim/conf.d/general.vim

source ~/.config/nvim/conf.d/keys.vim

source ~/.config/nvim/conf.d/misc.vim



"forhtmlonly!!!
"inoremap <buffer> > ></<C-x><C-o><C-y><C-o>%<CR><C-o>O
"


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
