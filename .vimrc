syntax on
" au BufNewFile,BufRead *.yaml,*.yml set et ts=2 sw=2 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
filetype indent plugin on
                        

set nocompatible
set expandtab
set ruler
set hlsearch
set encoding=utf-8
let g:indentLine_char = '⦙'
let g:airline_powerline_fonts = 1
let g:vim_json_conceal=0
