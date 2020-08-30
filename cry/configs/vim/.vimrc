call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
call plug#end()


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='term'
let g:tex_flavor = 'latex'

set wrap

map <F2> :Goyo<CR>
map <F3> :set nu!<CR>
map <F4> :N<CR>
map <F5> :n<CR>
map <F6> :set linebreak!<CR>
