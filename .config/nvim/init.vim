" Data directory for installations
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

" Install vim-plug
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Init plugins
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Install molokai if not installed
if empty(glob(data_dir . '/colors/molokai.vim'))
  silent execute '!curl -fLo '.data_dir.'/colors/molokai.vim --create-dirs  https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim'
endif

colorscheme molokai

" misc
filetype plugin on
set termguicolors
set mouse=a " use mouse
set autoread " read again if file changed
set backspace=indent,eol,start " backspace over anything
set virtualedit=all " block select passed eol

" interface
syntax enable
set title " show title of file
set number " numbers on side
set ruler " x,y on bottom right
set showcmd " show what command is being pressed
set showmatch " show matching brackets

" splits
set splitright
set splitbelow

" alerts
set belloff=all
set visualbell

" encoding
set encoding=utf-8
set fileencoding=utf-8

" autocomplete
set complete-=i
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " remap ctrl-n to tab if pop up menu visible

" cmd completion
set wildmenu
set wildchar=<Tab>
set wildmode=list:longest,list:full

" wrapping
set nowrap
set linebreak
set tw=80

" undo
set history=1000
set undofile
set undodir=~/.vim/undo
if empty(glob('~/.config/nvim/undo'))
    silent !mkdir -p ~/.config/nvim/undo
endif

" spaces / tabs
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

" search
set smartcase
set ignorecase
set incsearch " show matches in realtime
set gdefault " automatically global
set hlsearch " highlight all searches

