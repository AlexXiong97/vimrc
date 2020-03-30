set encoding=utf-8
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

" NERDTree config
let g:NERDTreeChDirMode = 2

" typescript-vim config
let g:typescript_indent_disable = 1
setlocal indentkeys+=0
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
let g:tsuquyomi_disable_quickfix = 1

" nvim-typescript config
let g:nvim_typescript#type_info_on_hold=1

" auto-format on buffer save, see https://github.com/Chiel92/vim-autoformat
fun! AutoFormatSpecificFiles()
  if index(map(['conf', 'solidity', ''], '&filetype =~ v:val'), 1) > -1
    return
  endif
  :Autoformat
endfun

au BufWrite * call AutoFormatSpecificFiles()  " Autoformat on writes
let g:formatter_yapf_style = 'google'
au filetype * setl expandtab
au filetype * set shiftwidth=2

" more keywords for syntax highlight
syn keyword   myTodo   contained   TODO FIXME
syn match   myTodo   contained   "\<\(TODO\|FIXME\):"
hi def link myTodo Todo

" Setup dein.vim manager
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  
  call dein#add('zchee/nvim-go', {'build': 'make'})
  call dein#end()
  call dein#save_state()
  " call dein#install()
endif

filetype plugin indent on
syntax enable
let g:deoplete#enable_at_startup = 1


