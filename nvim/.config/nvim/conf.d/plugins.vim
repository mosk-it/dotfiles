call plug#begin('~/.config/nvim/plug')

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
"Plug 'tpope/commentary.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'

" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'

Plug 'Konfekt/FastFold'
Plug 'troydm/zoomwintab.vim'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'

"Plug 'moorereason/vim-markdownfmt'
"Plug 'Raimondi/delimitMate'

Plug 'airblade/vim-gitgutter'

Plug 'jeetsukumaran/vim-buffergator'

Plug 'vim-scripts/CursorLineCurrentWindow'
"Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
"@TODO

Plug 'tpope/vim-fugitive'

"dev
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Plug 'ncm2/ncm2'
" Plug 'phpactor/phpactor'
" Plug 'phpactor/ncm2-phpactor'

Plug 'vim-syntastic/syntastic'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'vim-scripts/DrawIt', { 'for': 'markdown' }

Plug 'lambdalisue/suda.vim'

"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

call plug#end()
