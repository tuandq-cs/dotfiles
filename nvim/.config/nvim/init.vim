" General se{ search = vim.fn.input("Grep For > ")}ttings
set exrc
set guicursor=
set number
set relativenumber
set laststatus=2
set incsearch
set cursorline

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

" Tools
        Plug 'neovim/nvim-lspconfig'
        Plug 'itchyny/lightline.vim'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'


" Color-schemes
        Plug 'gruvbox-community/gruvbox'

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

" Remap configuration
let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

if filereadable(expand("./lsp/python-ls.lua"))
          source ./lsp/python-ls.lua
endif
