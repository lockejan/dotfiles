"------------Plugins-----------------------------------
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'airblade/vim-gitgutter'
    " Plug 'airblade/vim-rooter'
    " Plug 'bling/vim-bufferline'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    " Plug 'junegunn/fzf.vim',
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/gv.vim'
    Plug 'mihaifm/bufstop'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'christoomey/vim-tmux-navigator'
    " Plug 'sbdchd/neoformat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-startify'
    " Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-vinegar'
    " Plug 'vifm/vifm.vim'
    Plug 'vim-airline/vim-airline'
    " Plug 'wellle/targets.vim'
" Syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'kamailio/vim-kamailio-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'nvim-lua/completion-nvim'
" Color-schemes
    Plug 'flazz/vim-colorschemes'
    Plug 'arcticicestudio/nord-vim',
call plug#end()

"---------------Plugin settings------------------------
source $HOME/.config/nvim/plugin-settings/snips.vim
source $HOME/.config/nvim/plugin-settings/custom-keybindings.vim
source $HOME/.config/nvim/plugin-settings/better-defaults.vim
source $HOME/.config/nvim/plugin-settings/coc.vim
" source $HOME/.config/nvim/plugin-settings/nvim-lsp.vim
" source $HOME/.config/nvim/plugin-settings/fzf.vim
" source $HOME/.config/nvim/plugin-settings/markdow-preview.vim

nmap <C-P> :FZF<CR>

if(has("termguicolors"))
    set termguicolors     " enable true colors support
endif

autocmd! bufwritepost $VIMRC source $VIMRC

let g:python3_host_prog="/home/schmitt/.pyenv/shims/python"

" Git-Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

" Color settings
" colorscheme visualstudio
colorscheme nord

" Statusline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Get rid of trailing Whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Convenient command to see the difference between the current buffer and the:
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif

"write readonly file
 cmap w!! w !sudo tee % >/dev/null

"secure gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
