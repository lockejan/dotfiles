"set autochdir                           " Your working directory will always be the same as your working directory
set autoindent
set autoread		" auto re-read files if unmodified inside Vim
set backspace=indent,eol,start
set clipboard=unnamedplus               " Copy paste between vim and everything else
set confirm
set cursorline
set encoding=UTF-8
set expandtab    " Tabs are spaces, not tabs
set formatoptions-=cro                  " Stop newline continution of comments
set history=50		" keep 50 lines of command line history
set hlsearch                   " Highlight search terms
set ignorecase     " Case insensitive search
set incsearch                  " Find as you type search
set laststatus=2	" always display the status bar
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set mouse=a                    " Automatically enable mouse usage
set number
set pumheight=20         " makes popup menu smaller
set ruler		" show the cursor position all the time
set scrolloff=3    " Minumum lines to keep above and below cursor
set shiftround		" shifting lines round the indentation to the nearest multiple of "shiftwidth"
set shiftwidth=4   " Use indents of 4 spaces
set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set showcmd		" display incomplete commands
set showmatch      " Show matching brackets/parentthesis
set showtabline=2
set smartcase      " ... but case sensitive when uc present
set smartindent
set smarttab                   " Smart tab
set softtabstop=4  " Let backspace delete indent
set spelllang=en_us,de_de
set splitbelow splitright
set tabstop=4      " An indentation every four columns
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set title	 	" set windows title
set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries
set wildmenu		" disply cline tan complete options as a menu

syntax on                      " Syntax highlighting
filetype plugin indent on      " Automatically detect file types

"set complete-=i                " Exclude files from completion
"set laststatus=2               " Always show status line

" http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging/15095377#15095377
" set t_ut=

" ignore filetypes
set wildignore+=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip
set wildignore+=*/tmp/*,*.o,*.obj,*.so     " Unix

highlight clear SignColumn  " SignColumn should match background
" highlight clear LineNr      " Current line number row will have same background color in relative mode

" systemwide clipboard
if has('unnamedplus')
	set clipboard=unnamedplus,unnamed
else
	set clipboard+=unnamed
endif

" write undo for file changes
if has('persistent_undo')
	set undofile             " Persistent undo
	set undolevels=1000      " Maximum number of changes that can be undone
	set undoreload=10000     " Maximum number lines to save for undo on a buffer reload
endif
