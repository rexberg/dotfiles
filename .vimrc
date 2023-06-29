" Packages."
packadd! dracula
set termguicolors
set background=dark

" Remember last position. "
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
endif

" Tab. "
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" Enable syntax highlighting. "
syntax on

" Enable line numbers. "
set number

" Enable modeline. "
set modeline

" Split to the right by default."
set splitright

" Disable folding. "
set nofoldenable

" Set colorscheme."
colorscheme dracula

" File specific settings. "
au BufRead,BufNewFile *.cf set ft=cf3
au BufNewFile,BufRead *.sh set softtabstop=2
au BufNewFile,BufRead *.sh set shiftwidth=2
