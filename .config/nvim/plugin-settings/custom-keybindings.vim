let g:mapleader = "\<Space>"
let maplocalleader = "\."
map <leader>v :EditVifm .<CR>
map <leader>, :e ~/.config/nvim/init.vim<CR>
map <C-g>:GitGutterDisable <BAR> :set laststatus=0 <CR>
" map <leader>l :set background=light<CR>
" map <leader>b :set background=dark<CR>
map <C-S>:so %<CR>
nmap <leader><leader> :bnext<CR>
nmap <leader>. :bprevious<CR>
nmap <leader>l :ls<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! SudaWrite

" split movemment
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"resize split
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

"remap mark for dead keys on german keyboard
nmap ´ `
nmap à `a
nmap Á 'A
nmap À `A
nmap ç 'c
nmap Ç 'C
nmap é 'e
nmap è `e
nmap É 'E
nmap È `E
nmap í 'i
nmap ì `i
nmap Í 'I
nmap Ì `I
nmap ó 'o
nmap ò `o
nmap Ó 'O
nmap Ò `O
nmap ú 'u
nmap ù `u
nmap Ú 'U
nmap Ù `U

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Move visual selection vertically
xnoremap K :move '<-2<CR>gv-gv 
xnoremap J :move '>+1<CR>gv-gv

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Treat long lines as break lines (useful when moving around in them)
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Insert mode shortcut
inoremap <C-h> <BS>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" Bash like
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>

" Command mode shortcut
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>

" jj | escaping
inoremap jj <Esc>
cnoremap jj <C-c>

" Quit visual mode
vnoremap v <Esc>

" Move to the start of line
nnoremap <A-h> ^

" Move to the end of line
nnoremap <A-l> $

" Redo
nnoremap U <C-r>

" Quick command mode
nnoremap <CR> :

" Buffer
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>bc :Bclose<CR>
nnoremap <silent> <Leader>bk :bw<CR>
