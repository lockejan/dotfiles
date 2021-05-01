"------------Plugins-----------------------------------
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'mihaifm/bufstop'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-speeddating'
    Plug 'mhinz/vim-startify'
    Plug 'lambdalisue/suda.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-vinegar'
    Plug 'vim-airline/vim-airline'
" Syntax
    " Plug 'sheerun/vim-polyglot'
    Plug 'kamailio/vim-kamailio-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'kyazdani42/nvim-web-devicons'
" Color-schemes
    Plug 'gruvbox-community/gruvbox',
    Plug 'arcticicestudio/nord-vim',
call plug#end()

"---------------Plugin settings----------------------
source $HOME/.config/nvim/plugin-settings/custom-keybindings.vim
source $HOME/.config/nvim/plugin-settings/better-defaults.vim
source $HOME/.config/nvim/plugin-settings/snips.vim
source $HOME/.config/nvim/plugin-settings/coc.vim
source $HOME/.config/nvim/plugin-settings/fzf.vim
source $HOME/.config/nvim/plugin-settings/treesitter.vim

nmap <C-P> :FZF<CR>

if(has("termguicolors"))
    set termguicolors     " enable true colors support
endif

" Source config immidiately after saving
autocmd! bufwritepost $VIMRC source $VIMRC

let g:python3_host_prog="/home/schmitt/.pyenv/shims/python"

" Git-Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
nmap <leader>ph <Plug>(GitGutterPreviewHunk)
nmap <leader>ghs <Plug>(GitGutterStageHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)

" Color settings
colorscheme nord
highligh Normal guibg=none

" yate -> dosini syntax
autocmd BufNewFile,BufRead *.conf set syntax=dosini

" Statusline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Get rid of trailing Whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"secure gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
