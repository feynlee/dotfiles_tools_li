"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommand
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto GUI settings to prevent further changes from other files
" au BufEnter * highlight Cursor guibg=yellow
" au BufEnter * highlight iCursor guibg=yellow
" au BufEnter * set guicursor+=i:ver15-iCursor
" au BufEnter * set cursorline

" automatically make sessions when logout
autocmd VimLeave * mksession! ~/Tmp/vimsession/recent.vim
" What does this do??
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1

" " Save Foldings and Auto-load Foldings
set viewoptions=folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" auto change the directory to ~/.vim when editing .vimrc
au BufEnter * silent! cd %:p:h

" Cursor Color
" autocmd ColorScheme * highlight Cursor guifg=black guibg=Yellow
" Automatically save when losing focus
au FocusLost * :wa
" Automatically save when entering normal mode
" au InsertLeave * :w

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Change to the current directory automatically when entering buffer
" au BufWinEnter * lcd %:p:h

" When in vimrc automatically map ,e and ,so to edit and source new setting
" files
au BufEnter ~/Code/dotfiles/.vim/vimrc inoremap <buffer> ,so source ~/.vim/startup/
au BufEnter ~/Code/dotfiles/.vim/vimrc nnoremap <buffer> ,e  :e ~/.vim/startup/
au BufEnter ~/.vimrc inoremap <buffer> ,so source ~/.vim/startup/
au BufEnter ~/.vimrc nnoremap <buffer> ,e  :e ~/.vim/startup/

au FilterWritePre * if &diff | setlocal wrap< | endif
" automatically source configuration files
autocmd! BufWritePost ~/.vimrc source %
autocmd! BufWritePost ~/.vim/startup/*  source %


" set number when focus is lost and relative number when focus is gained
" au FocusLost * :set nornu nu
" au FocusGained * :set nonu rnu
" set number in insert mode and relative number in normal mode
" autocmd InsertEnter * :set nornu nu " autocmd InsertLeave * :set nonu rnu

" Automatically remove trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" Automatically set filetype for tex files
" autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
