" Enable syntax highlighting. "
syntax on

" Enable modeline. "
set modeline

" Enable cursorcolumn
set cursorcolumn

" Insterting timestamp with tag system in notes.txt. "
nnoremap <F5> "=strftime("%F_%T (%Z) %A tags::")<CR>P
inoremap <F5> <C-R>=strftime("%F_%T (%Z) %A tags::")<CR>
