"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping of Keys
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------- General mappings ----------------------------
" map! <C-m> <C-[>
" map <C-m> <C-[>
" inoremap <c-m> <c-[>
nnoremap ; :
nmap <silent> ;; :!

" Terminal mappings
" Force <C-Space> to map to <Esc> in terminal
" inoremap <C-space> <Esc>
" cnoremap <C-space> <Esc>
" inoremap <C-@> <C-space>
inoremap jk <Esc>
inoremap kj <Esc>
" protecting <Enter> key in insert mode
inoremap <CR> <CR>

"------------------------------- Movement mappings ---------------------------
nmap <C-k> <C-U>
nmap <C-j> <C-D>
map <C-l> g$
map <C-h> g^
map j gj
map k gk
map <Up> gk
map <Down> gj
imap <C-l> <Right>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-u> <C-x>
" cnoremap <C-h>      <Home>
cnoremap <C-j>      <Left>
" cnoremap <C-l>      <End>
cnoremap <C-k>      <Right>
cnoremap <C-u>      <Up>
" start of the row
map H ^
" end of the row
map L $
nmap <silent> gl <C-]>
let mapleader = " "
" Window mappings
nmap <silent> ,j :wincmd j <CR>
nmap <silent> ,k :wincmd k <CR>
nmap <silent> ,l :wincmd l <CR>
nmap <silent> ,h :wincmd h <CR>
nmap <silent> ,c :wincmd c <CR>
nmap <silent> ,o :wincmd o <CR>
" Better command-line editing
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" Tab mappings
nmap <silent> ;n :tabn <CR>
nmap <silent> ;m :tabp <CR>



"------------------------------- Change Directory ----------------------------
" Change the directory to the currently opened file
nmap <silent> ,dc :lcd %:p:h<CR>:!pwd<CR>
" Change the directory to ~/.vim/
" nmap <silent> ,dv :cd ~/.vim/<CR>:!pwd<CR>
" Change the directory to ~/.vim/bundle/
nmap <silent> ,db :cd ~/.vim/bundle/<CR>:!pwd<CR>

"------------------------------- Editing mappings ----------------------------
nmap <silent> ,ev :e ~/.vimrc <CR>
" nmap <silent> ,eg :e ~/.gvimrc <CR>
nmap <silent> ,eg :e ~/.vim/startup/Generalsettings.vim <CR>
nmap <silent> ,em :e ~/.vim/startup/mappings.vim <CR>
nmap <silent> ,ea :e ~/.vim/startup/autocommands.vim <CR>
" Edit the Tex-nine key bindings
nmap <silent> ,en :e ~/.vim/bundle/TeX-9/ftplugin/tex_nine.vim <CR>
" Edit the Ultisnips snippets
nmap <silent> ,et :e ~/.vim/Ulti_Snips/tex.snippets<CR>
nmap <silent> ,eh :e ~/.vim/Ulti_Snips/html.snippets<CR>
nmap <silent> ,es :e ~/.vim/Ulti_Snips/all.snippets<CR>
nmap <silent> ,vv :e ~/.vim/startup/vundle.vim <CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Toggle on and off Spell check
nmap <silent> ,sc :setlocal spell spelllang=en_us<CR>
"F7 WordProcessorOn
map <silent> ,wo :set linebreak <CR> :set display+=lastline <CR> :set wrap <CR> :set fo=watcq <CR>
"F8 WordProcessorOff
map <silent> ,wf :set nowrap <CR> :set nospell <CR> :set fo=tcq <CR>

" nmap <silent> ,ff gggqG<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>
" nmap <Space>  :star<CR> <C-[>
nmap <CR> o<C-[>
imap <silent> .<Space> .<CR>
nmap <silent> ,dv :vert diffsplit
nmap <silent> vv <C-h>v<C-l>
" visual reselect of just pasted
nnoremap gp `[v`]
" diff vertical split
nmap <silent> ,df :vert diffsplit ~/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Project.vim
nmap <silent> ,tp <Plug>ToggleProject
" Toggle Nerdtree.vim
nmap <silent> ,tn :NERDTreeToggle <CR>
" Toggle LustyJuggler.vim
nmap <silent> ,tj :LustyJuggler <CR>
" Toggle Gundo.vim
nnoremap <silent> ,tg :GundoToggle <CR>
nnoremap <silent> ,tv :PluginSearch <CR>


" Toggle Tagbar
" nnoremap <silent> ,tt :TagbarToggle <CR>
" nnoremap <silent> ,tt :TlistToggle<CR> " Toggle taglist.vim

" Vundle
nmap <silent> ;vs :PluginSearch <CR>
nmap <silent> ;vu :PluginUpdate <CR>
nmap <silent> ;vi :PluginInstall <CR>
nmap <silent> ;vc :PluginClean <CR>

" Ctrl-p plugin
nnoremap <silent> <c-b> :CtrlPBuffer <CR>           " Open Buffer mode
" nnoremap <silent> rr :CtrlPMRU <CR>              " Open MRU mode

" Easymotion plugin
map <Leader><Leader> <Plug>(easymotion-s)
map <Leader>t <Plug>(easymotion-bd-t)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-bd-e)
map <Leader>l <Plug>(easymotion-bd-jk)
map <Leader>k <Plug>(easymotion-k)
map <Leader>j <Plug>(easymotion-j)
map <Leader>n <Plug>(easymotion-bd-n)

" nmap <silent> <Space><Space> <Leader><Leader>
" nmap <silent> <Space><Space>f <Plug>(easymotion-f)
" nmap <silent> <Space><Space>F <Plug>(easymotion-F)
" nmap <silent> ;t <Plug>(easymotion-t)
" nmap <silent> ;T <Plug>(easymotion-T)

" Yankring plugin
nnoremap <silent> ,yr :YRShow <CR>

" Gitv plugin
nmap ,gv :Gitv --all<CR>
" checkout/switch branches
nmap ,co :!git checkout
" merge without fast forward
nmap ,mg :!git merge --no-ff

" Fugitive plugin
" Git Status
map ,gs :Gstatus <CR>
" Git Commit
nmap ,gc :Gcommit -am '



" Make sessions
nmap <silent> ,ms :mksession! ~/Tmp/vimsession/recent.vim<CR>

function! Makesession()
       so ~/Tmp/vimsession/recent.vim
       highlight Cursor guifg=black guibg=Yellow
endfunction

nmap <silent> ,ss :call Makesession() <CR>
" nmap <silent> ,ga :!git submodule add
" nmap <silent> ,gr :!git rm --cached


"""""
" Abbreviation
""""""""""""""""""
abc
iab ths this
iab wht what
iab <expr> dts strftime("%c")