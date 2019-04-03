"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tex_nine Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tex_flavor = 'latex'
let g:tex_viewer = {'app': 'xdg-open', 'target': 'pdf'}
" let g:tex_verbose = 1


" let g:tex_bibfiles = ['~/Library/texmf/bibtex/bib/References.bib']
let g:tex_bibfiles = ['References.bib']

" let g:tex_fold_enabled=1
" disable Tex-9
" au BufReadPre *.tex let b:init_tex_nine = 1

" Don't Auto-complete [ ( {
let g:tex_cycle_delimeters = 0

" ~/.vim/after/ftplugin/tex.vim
" Change the mapping of <LocalLeader>S to \Sigma
" au FileType tex inoremap <buffer> <LocalLeader>S \Sigma
