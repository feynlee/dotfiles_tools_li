" enable tabline to show buffers
let g:airline#extensions#tabline#enabled = 1

" if !exists("g:airline_symbols")
"   let g:airline_symbols = {}
" endif

let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
" let g:airline_section_warning = airline#section#create([ "syntastic" ])
let g:airline#extensions#branch#empty_message  =  "No SCM"
let g:airline#extensions#branch#enabled        =  1
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
" use patched fonts (symbol)
" set guifont=Liberation\ Mono\ for\ Powerline
" set guifont=Source\ Code\ Pro\ for\ Powerline

" Git status line
" let g:airline_section_b = '⭠ %{fugitive#statusline()}'
" configure the layout
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'warning' ]
    \ ]
" only detect trailing whitespace, not indent whitespace
let g:airline#extensions#whitespace#checks = [ 'trailing' ]