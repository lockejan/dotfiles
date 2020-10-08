"------------Plugins-----------------------------------
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'bling/vim-bufferline'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'junegunn/fzf.vim',
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/gv.vim'
    Plug 'lambdalisue/suda.vim'
    Plug 'mihaifm/bufstop'
    Plug 'rbgrouleff/bclose.vim'
    " Plug 'sbdchd/neoformat'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'unkiwii/vim-nerdtree-sync'
    Plug 'vifm/vifm.vim'
    Plug 'vim-airline/vim-airline'
    " Plug 'wellle/targets.vim'
" Syntax
    Plug 'mboughaba/i3config.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
" Color-schemes
    Plug 'morhetz/gruvbox'
call plug#end()

"---------------Plugin settings------------------------
source $HOME/.config/nvim/plugin-settings/snips.vim
source $HOME/.config/nvim/plugin-settings/custom-keybindings.vim
source $HOME/.config/nvim/plugin-settings/better-defaults.vim
source $HOME/.config/nvim/plugin-settings/fzf.vim
source $HOME/.config/nvim/plugin-settings/coc.vim
source $HOME/.config/nvim/plugin-settings/markdow-preview.vim

autocmd! bufwritepost $VIMRC source $VIMRC

" Neoformat
let g:neoformat_enabled_python = ['autopep8']
" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.{py,ts,js} Neoformat
" augroup END

let g:ormolu_ghc_opt=["TypeApplications", "RankNTypes"]
let g:python3_host_prog="/home/schmitt/.pyenv/versions/neovim3/bin/python"

" Git-Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" Color settings
colorscheme gruvbox
set background=dark
hi! Normal ctermbg=NONE guibg=NONE

" Statusline config
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" Get rid of trailing Whitespaces
function TrimWhitespace()
    %s/\s*$//
    ''
:endfunction
command! Trim call TrimWhitespace()

" Convenient command to see the difference between the current buffer and the:
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

" NERDTREE settings
nmap <C-n> :NERDTreeToggle<CR>
nmap ,m :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

let g:plug_window = 'noautocmd vertical topleft new'
let NERDTreeShowHidden=1

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufRead * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufRead * call SyncTree()
autocmd BufRead * call SyncTree()

augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END
