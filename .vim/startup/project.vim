"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project - Manage Project more easily
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:proj_window_width=30

" let g:proj_flags="bcmLst"

" map <silent> <Leader>pp :Project<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project for vundle
"let g:project_use_nerdtree = 1
"set rtp+=~/.vim/bundle/vim-project/
"call project#rc("~/Code")
"
"Project  'scratch'
"
"Project  'dotfiles'
"File     'dotfiles/vimrc'                       , 'vimrc'
"File     'dotfiles/gvimrc'                      , 'gvimrc'
"File     'dotfiles/zshrc'                       , 'zshrc'
"
"Project  'gollum'
"File     'gollum/Todo.md'                       , 'todo'
"Callback 'gollum'                               , 'RemoveTextWidth'
"
"function! RemoveTextWidth(...) abort
"  setlocal textwidth=0
"endfunction
"
"Project  'octopress'
"Project  'gsource'
"Project  'markup'
"Project  'glib'
"Project  'reloadlive'
"Project  'flashcards'
"Project  'leitner'
"Callback 'leitner'                              , ['AddSpecToPath', 'RemoveTextWidth']
"
"function! AddSpecToPath(tile) abort
"  setlocal path+=spec
"endfunction
"
"Project  '~/.vim/bundle/vim-fenced-code-blocks' , 'fenced'
"Project  '~/.vim/bundle/vim-project'            , 'project'
"Project  '~/.vim/bundle/vim-bookmarks'          , 'bookmarks'
"Project  '~/.vim/bundle/ctrlp.vim'              , 'ctrlp'
"Project  '~/.vim/bundle/ctrlp-z'                , 'ctrlp-z'
"Project  '~/.vim/bundle/vim-eval'               , 'eval'