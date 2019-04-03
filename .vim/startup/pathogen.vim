"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []

" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has('gui_running')
    call add(g:pathogen_disabled, 'Ultisnips')
endif

" Gundo requires at least vim 7.3
if v:version < '703' || !has('python')
    call add(g:pathogen_disabled, 'gundo')
endif

if v:version < '702'
    call add(g:pathogen_disabled, 'FuzzyFinder')
    call add(g:pathogen_disabled, 'L9')
endif

" turn off compatibility with the old vi
set nocompatible
" pathogen - to make plugin management easier
" use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" turns on filetype detection, plugin, indent
filetype plugin indent on
" turn syntax highlighting on by default
syntax on

" Delete all user-defined commands
" comc

