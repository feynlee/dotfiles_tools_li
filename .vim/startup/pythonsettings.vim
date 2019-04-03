autocmd FileType,BufWinEnter *.py call Pysetting()
"
""
function! Pysetting()
    if &filetype == "python"
        " set tabstop=4
        " set softtabstop=4
        " set shiftwidth=4
        " set expandtab
        set textwidth=79
        " set autoindent
        set fileformat=unix
        " let g:pymode_indent = 0
        " Enable folding with the spacebar
        " nnoremap <space> za
        " Fix PEP8 errors in current buffer automatically
        nnoremap <silent> <LocalLeader><LocalLeader>f :PymodeLintAuto <CR>
    endif
endfunction