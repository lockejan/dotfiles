"------------Plugins-----------------------------------
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    " Plug 'bling/vim-bufferline'
    " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'mihaifm/bufstop'
    Plug 'rbgrouleff/bclose.vim'
    Plug 'christoomey/vim-tmux-navigator'
    " Plug 'sbdchd/neoformat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-startify'
    " Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-vinegar'
    Plug 'vim-airline/vim-airline'
    " Plug 'wellle/targets.vim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'p00f/nvim-ts-rainbow',
    "undo tree
    "nvim lsp
" Syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'kamailio/vim-kamailio-syntax'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Color-schemes
    Plug 'gruvbox-community/gruvbox',
    Plug 'arcticicestudio/nord-vim',
call plug#end()

"---------------Plugin settings------------------------
source $HOME/.config/nvim/plugin-settings/custom-keybindings.vim
source $HOME/.config/nvim/plugin-settings/better-defaults.vim
source $HOME/.config/nvim/plugin-settings/snips.vim
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
nmap <leader>ph <Plug>(GitGutterPreviewHunk)
nmap <leader>ghs <Plug>(GitGutterStageHunk)
nmap <leader>ghu <Plug>(GitGutterUndoHunk)

" Color settings
colorscheme nord
" colorscheme gruvbox
highligh Normal guibg=none

" yate -> dosini syntax
autocmd BufNewFile,BufRead *.conf set syntax=dosini

" Statusline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Get rid of trailing Whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

"write readonly file
 cmap w!! w !sudo tee % >/dev/null

"secure gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
    rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  },
}
EOF
