" set mouse-=a 

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

