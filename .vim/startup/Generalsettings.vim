"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" turn syntax highlighting on by default
syntax on

" Turn on filetype detection
filetype on
" automatically show matching brackets. works like it does in bbedit.
" set showmatch

"filename auto completion
"set wildmode=list:full
set wildmenu
" Character to start command line completion
" set wildchar=<TAB>
" When completing by tag, show the whole tag, not just the function name
set showfulltag
" Enable search highlighting
set nohlsearch
set ignorecase
set smartcase
set gdefault
set incsearch           " Incremental search
" Enable Dictionary Completions
set complete+=k


" Don't unload buffer when close.
set hidden

" Switch to Pastemode
set pastetoggle=<F2>
set clipboard=unnamed

" set list                " Try showing this all the time with better listchars
" set listchars=tab:>-,trail:·,extends:»,precedes:«
set modeline            " Scan for modeline commands
set modelines=5         " Scan 5 lines for modelines
set report=0            " Always report line changes for : commands
set ruler               " Show cursor location

set scrolljump=-10      " Scroll half the window height when move off screen
set ttyfast             " assume a fast terminal connection

" Remember Marks in 1000 Recent files, save up to 500 lines for each register
set viminfo='1000,f1,<500,!

" let maplocalleader=";"  " set localleader to be ;
" turn on the "visual bell" - which is much quieter than the "audio blink"
set vb

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" do NOT put a carriage return at the end of the last line! if you are programming
" for the web the default will cause http headers to be sent. that's bad.
set binary noeol

" make that backspace key work the way it should
set backspace=indent,eol,start

" set up backupdirectory /no swap files
set backupdir=~/tmp/backup/
set directory=~/tmp/swap/
set autoread "automatically read file while changed outside of vim
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile
set lazyredraw   "This stops Vim from redrawing the screen during complex operations and results in much smoother looking plugins.


""""""""""""""""""
"Ignore file types
""""""""""""""""""
set wildignore+=*.o,*.a
set wildignore+=*.zip,*.tar,*.tbz,*.mp4,*.mp3,*.mov,*.ass,*.srt
set wildignore+=*.gif,*.jpg,*.png,*.pdf,*.djvu,*.bmp,*.ico
set wildignore+=*.aux,*.fls,*.lof,*.lot,*.out,*.gz
set wildignore+=*.bst,*.bib,*.bbl,*.blg,*.sty,*.cls
set wildignore+=*.toc,*.xml,*.latexmain,*.fdb_latexmk
set wildignore+=.DS_Store,.git,.svn,.hg
set wildignore+=*.log,*.swp,*.tmp,*.nb
set wildignore+=*.app,*.pages,*.numbers,*.key,*.xls