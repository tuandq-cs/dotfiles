" General settings
set exrc
set guicursor=
set number
set relativenumber
set laststatus=2
set incsearch

" Define the length of the real <Tab> should be. 
" When change this value, all <Tab>s in document will change too.
set tabstop=4
" Turn on 'expandtab' to insert spaces (numbers define by 'softtabstop') 
" instead of the real <Tab>
set expandtab
set softtabstop=4

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set scrolloff=8

" Color settings
set colorcolumn=80
set signcolumn=yes

" Plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

" Colorscheme configuration
set background=dark
colorscheme gruvbox

" Lightline: Statusline configuration
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

