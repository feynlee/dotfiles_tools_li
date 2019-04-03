"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neocomplcache set up: Ultimate auto completion system for vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Overwrite other plugins' 'completefunc' option, protect neocomplcache from
" being disabled by other plugins
"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" let g:neocomplete#force_overwrite_completefunc = 1