call plug#begin('~/.config/nvim/plug')

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'commentary.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'Konfekt/FastFold'
Plug 'troydm/zoomwintab.vim'

Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'moorereason/vim-markdownfmt'
Plug 'Raimondi/delimitMate'

Plug 'airblade/vim-gitgutter'

Plug 'jeetsukumaran/vim-buffergator'
Plug 'CursorLineCurrentWindow'

Plug 'CursorLineCurrentWindow'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
"@TODO
Plug 'amerlyq/nou.vim'
Plug 'ervandew/supertab'


"php

Plug 'lvht/phpcd.vim' , { 'for': 'php' }
Plug 'docteurklein/php-getter-setter.vim', { 'for': 'php' }
Plug 'evidens/vim-twig', { 'for': 'twig' }


call plug#end()
