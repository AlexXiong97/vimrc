set nocompatible

" linenumber
set number

" set theme color
try 
    colorscheme onedark 
catch
endtry

" set system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
set clipboard=unnamedplus

" disable auto folding of nested component
set nofoldenable    " disable folding"

" typescript-vim config
let g:typescript_indent_disable = 1
setlocal indentkeys+=0
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

