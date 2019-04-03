"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme gruvbox
endif
set background=dark
let g:solarized_termcolors=256
if &term == "screen"
  set t_Co=256
endif
" set number lines to be on
set nu

" font
" set gfn=Monaco\ for\ Powerline:h14
" set gfn=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h13
" set guifont to be patched powerline fonts
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline:h13

" no menu / toolbar / scrollbars
set guioptions-=r
set guioptions-=l
set guioptions-=m
set guioptions-=T
set guioptions-=L

" Set the status line the way i like it
"set stl=%f\ %m\ %r\ [%{&fo}]\ ine:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set shortmess=aoOtT     " Abbreviate the status messages
set showmode            " Show mode I'm in
set showcmd             " Show command I'm typing
set laststatus=2        " Always show status line

set splitright

" " Cursors are set in autocommand file to prevent being changed
highlight Cursor guibg=yellow
highlight iCursor guibg=yellow
" set guicursor+=i:ver15-iCursor
" set cursorline          " highlight current line


" hi cursorline term=bold cterm=None guibg=Grey40

" Setting this below makes it so that error messages don't disappear
" after one second on startup.
set debug=msg

" Make command line two lines high
set cmdheight=2