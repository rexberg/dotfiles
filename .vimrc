" Tab. "
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Enable syntax highlighting. "
syntax on

" Enable modeline. "
set modeline

" Disable folding. "
set nofoldenable

" Change file type to cf3 for *.cf files (needed for cf3.vim syntax "
" highlighting). "
au BufRead,BufNewFile *.cf set ft=cf3

" Insterting timestamp with tag system in notes.txt. "
nnoremap <F5> "=strftime("%F_%T (%Z) %A tags::")<CR>P
inoremap <F5> <C-R>=strftime("%F_%T (%Z) %A tags::")<CR>
