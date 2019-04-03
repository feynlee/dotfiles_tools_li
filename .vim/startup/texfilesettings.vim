"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex General Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_indent_items = 1 " indent for items
let g:tex_comment_nospell= 1 " no spell checking for comments
" let g:tex_fold_enabled = 1 " enable folding


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" only for tex files
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmd BufNewFile,BufRead *.tex setlocal filetype=tex

if has("autocmd")

  " Set File type to 'tex' for files ending in .tex
    autocmd BufNewFile,BufRead *.tex let maplocalleader=";"
    autocmd FileType tex let maplocalleader=";"



  " Enable soft-wrapping for text files
    autocmd FileType tex setlocal fo=tcq nolist textwidth=0
    autocmd FileType tex nmap <C-n> (
    autocmd FileType tex nmap <C-m> )
    autocmd FileType tex setlocal spell spelllang=en_us
  " Define what is a word
    autocmd FileType tex set iskeyword=@,48-57,_,-,:,192-255
    autocmd FileType tex highlight Cursor guifg=black guibg=Yellow
endif

" Define new Command for tex
" command! SUBScript :normal i[<Tab>


" In Tex file, do the following mapping, works with Tex-9 plug-in
autocmd FileType,BufWinEnter *.tex call F12map()
"
""
function! F12map()
    if &filetype == "tex"
       " map  <silent> <buffer> <D-i> :call LatexBox_JumpToNextBraces(0)<CR>
       " map  <silent> <buffer> <D-u> :call LatexBox_JumpToNextBraces(1)<CR>
       " imap <silent> <buffer> <D-i> <C-R>=LatexBox_JumpToNextBraces(0)<CR>
       " imap <silent> <buffer> <D-u> <C-R>=LatexBox_JumpToNextBraces(1)<CR>
       nmap <silent> <buffer> ,a vie:Align &<CR>
       " inoremap <buffer> ;u ;u<C-R>=UltiSnips_Anon('^{$1}', ';u', 'superscript', 'i')<cr>
       " inoremap <buffer> ;d ;d<C-R>=UltiSnips_Anon('_{$1}', ';d', 'subscript', 'i')<cr>
       " inoremap <buffer> ;a ;a<C-R>=UltiSnips_Anon('_{$1}^{$2}', ';a', 'sub-superscript', 'i')<cr>
       " inoremap <buffer> ;bf ;bf<C-R>=UltiSnips_Anon('\\mathbf{$1}', ';bf', '\mathbf', 'i')<cr>

       " Greek
       inoremap <buffer> <LocalLeader>a \\alpha
       inoremap <buffer> <LocalLeader>b \\beta
       inoremap <buffer> <LocalLeader>c \\chi
       inoremap <buffer> <LocalLeader>d \\delta
       inoremap <buffer> <LocalLeader>e \\epsilon
       inoremap <buffer> <LocalLeader>f \\phi
       inoremap <buffer> <LocalLeader>g \\gamma
       inoremap <buffer> <LocalLeader>h \\eta
       inoremap <buffer> <LocalLeader>k \\kappa
       inoremap <buffer> <LocalLeader>l \\lambda
       inoremap <buffer> <LocalLeader>m \\mu
       inoremap <buffer> <LocalLeader>n \\nu
       inoremap <buffer> <LocalLeader>o \\omega
       inoremap <buffer> <LocalLeader>p \\pi
       inoremap <buffer> <LocalLeader>q \\theta
       inoremap <buffer> <LocalLeader>r \\rho
       inoremap <buffer> <LocalLeader>s \\sigma
       inoremap <buffer> <LocalLeader>t \\tau
       inoremap <buffer> <LocalLeader>u \\upsilon
       inoremap <buffer> <LocalLeader>w \\varpi
       inoremap <buffer> <LocalLeader>x \\xi
       inoremap <buffer> <LocalLeader>y \\psi
       inoremap <buffer> <LocalLeader>z \\zeta
       inoremap <buffer> <LocalLeader>D \\Delta
       inoremap <buffer> <LocalLeader>F \\Phi
       inoremap <buffer> <LocalLeader>G \\Gamma
       inoremap <buffer> <LocalLeader>L \\Lambda
       inoremap <buffer> <LocalLeader>O \\Omega
       inoremap <buffer> <LocalLeader>P \\Pi
       inoremap <buffer> <LocalLeader>Q \\Theta
       inoremap <buffer> <LocalLeader>U \\Upsilon
       inoremap <buffer> <LocalLeader>X \\Xi
       inoremap <buffer> <LocalLeader>Y \\Psi
       inoremap <buffer> <LocalLeader>T \\times


       " Math
       inoremap <buffer> <LocalLeader>½ \\sqrt{}<Left>
       inoremap <buffer> <LocalLeader>N \\nabla
       inoremap <buffer> <LocalLeader>S \\Sigma
       inoremap <buffer> <LocalLeader>I \\int\limits_{}^{}<Esc>F}i
       inoremap <buffer> <LocalLeader>0 \\emptyset
       inoremap <buffer> <LocalLeader>6 \\partial
       inoremap <buffer> <LocalLeader>i \\infty
       inoremap <buffer> <LocalLeader>/ \\frac{}{}<Esc>F}i
       inoremap <buffer> <LocalLeader>v \\vee
       inoremap <buffer> <LocalLeader>& \\wedge
       inoremap <buffer> <LocalLeader>@ \\circ
       inoremap <buffer> <LocalLeader>\ \\setminus
       inoremap <buffer> <LocalLeader>= \\equiv
       inoremap <buffer> <LocalLeader>- \\bigcap
       inoremap <buffer> <LocalLeader>+ \\bigcup
       inoremap <buffer> <LocalLeader>< \\leq
       inoremap <buffer> <LocalLeader>> \\geq
       inoremap <buffer> <LocalLeader>~ \\tilde{}<Left>
       inoremap <buffer> <LocalLeader>^ \\hat{}<Left>
       inoremap <buffer> <LocalLeader>_ \\bar{}<Left>
       inoremap <buffer> <LocalLeader>. \\dot{}<Left>
       inoremap <buffer> <localleader><cr> \\nonumber\\<cr>
       inoremap <buffer> ;. \\cdot
       inoremap <buffer> <LocalLeader>R \\ref{<C-X><C-O>
       inoremap <buffer> <LocalLeader>C \\cite{<C-X><C-O>
       nmap <buffer> ,er :LatexErrors<cr>
       " inoremap <buffer> ;t \\times
       " inoremap <buffer> $$ $$<C-R>=UltiSnips_Anon('$$1$', '$$', 'math', 'i')<cr>
       "inoremap <silent> ;i \int
       " inoremap <buffer> ;i \\int
        " Latex-box plugin
        nmap <silent> ,tc :LatexTOC <CR>       " Toggle Table of Content
        " The Following Mappings are defined in tex.vim in ftplugin folder
        "------------------------------------------------------------------
        " Change the current enironment
        nmap <buffer> ,ce <Plug>LatexChangeEnv
        " Wrap Selection with Latex Commands
        vmap <buffer> ,wc <Plug>LatexWrapSelection
        " Wrap the Current Selection with Latex Environment
        vmap <buffer> ,we <Plug>LatexEnvWrapSelection
        "-----------------------------------------------------------------


       function! Sub_script()
         exec "normal i[\<Tab>"
       endfunction
       " au InsertCharPre [ call Sub_script()
       " imap <silent> <buffer> [ call Sub_script()<CR>
       " inoremap <silent> [  [<C-R>=UltiSnips_AddSnippet('[', '[$1]', 'brackets', '!i')<cr>
       " inoremap <buffer> ;I ;I<C-R>=UltiSnips_Anon('\\int_{$1}^{$2}$3',';I', 'integral', 'i')<cr>
       " inoremap <buffer> ;/ ;/<C-R>=UltiSnips_Anon('\\frac{$1}{$2}$3', ';/', 'fraction', 'i')<cr>
       " inoremap <buffer> [ [<C-R>=UltiSnips_Anon('[$1]', '[', 'brackets', 'i')<cr>
       " inoremap <buffer> ( (<C-R>=UltiSnips_Anon('($1)', '(', 'parentheses', 'i')<cr>
       " inoremap <buffer> { {<C-R>=UltiSnips_Anon('{$1}', '{', 'braces', 'i')<cr>
       " imap <buffer> <Tab> <C-l>
       highlight Cursor guifg=black guibg=Yellow
       "       imap <C--> __<Tab>
     endif
endfunction