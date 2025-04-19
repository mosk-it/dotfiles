" nnoremap <leader><C-g> :GitGutterToggle<cr>
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" let g:gitgutter_signs = 0



augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif




autocmd FileChangedRO * :call ReadOnlyWarning()
function! ReadOnlyWarning ()
endfunction


" --- type ° to search the word in all files in the current dir
nmap <leader>? :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <leader>/ :Ag 
"replace spaces to _ and lowercase, to md's urls
vnoremap <leader>u u:s/\%V\ /_/g<CR>


" gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']


noremap <F5> "=strftime("%a %Y-%m-%d %H:%M:%S")<CR>P

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1

inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")

" on save remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
