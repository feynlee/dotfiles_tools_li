"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex-box Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View pdf using skim
" let g:LatexBox_viewer = '/Applications/Skim.app'
" let g:LatexBox_latexmk_options = "-pdflatex='pdflatex -synctex=1 \%O \%S'"
let g:LatexBox_latexmk_options = "-pvc"

let g:LatexBox_latexmk_async = 1
" prevent the error message window from appearing automatically
" to see error messages use :LatexErrors
" let g:LatexBox_quickfix=0
" let g:LatexBox_latexmk_preview_continuously = 1

map <silent> <Leader>cc :exe "silent !pdflatex ".@% <CR>
map <silent> <Leader>ls :silent
                \ !/Applications/Skim.app/Contents/SharedSupport/displayline
                \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
                \ "%:p" <CR>

" map <silent> <Leader>ls :silent
"   \!/Applications/Skim.app/Contents/SharedSupport/displayline
"   \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>