"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive - Makes Git Easier
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline=%<%f\ [%{&fo}]\ %{fugitive#statusline()}%=%-20(%l/%L[%p%%]\ Col:%v%)\ Buf:#%n\ %y\ %h%m%r

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Get back to parent directory in the Tree Object
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

