vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 2
vim.o.incsearch = true
vim.o.cursorline = true

-- Define the length of the real <Tab> should be.
-- When change this value, all <Tab>s in document will change too.
vim.o.tabstop = 4
-- Turn on 'expandtab' to insert spaces (numbers define by 'softtabstop')
-- instead of the real <Tab>
vim.o.expandtab = true
vim.o.softtabstop = 4

vim.o.swapfile = false
vim.o.backup = false
--vim.o.undodir = '~/.vim/undodir'
vim.o.undofile = true

vim.o.scrolloff = 8

-- Color settings
vim.o.termguicolors = 80
vim.o.colorcolumn = 80
vim.o.signcolumn = 'yes'

-- Colorscheme configuration
vim.o.background = 'dark'

vim.cmd[[colorscheme tokyonight]]
