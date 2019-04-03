" Latex-box mappings for tex files
" Change the current enironment
nmap <buffer> ,ce <Plug>LatexChangeEnv
"
" Wrap Selection with Latex Commands
vmap <buffer> ,wc <Plug>LatexWrapSelection
"
" Wrap the Current Selection with Latex Environment
vmap <buffer> ,we <Plug>LatexEnvWrapSelection

" Change the mapping of <LocalLeader>S to \Sigma
au FileType tex inoremap <buffer> <LocalLeader>S \Sigma
