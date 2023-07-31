-- Modes
-- "n": Normal mode,
-- "i": Insert mode,
-- "v": Visual mode,
-- "x": Visual block mode,
-- "t": Terminal mode,
-- "c": Command mode,

-- Leader key
vim.g.mapleader = ' '

-- Shorten function name
local set_keymap = vim.api.nvim_set_keymap

-- Shorten options
local ns_opt = { noremap = true, silent = true }

-- 			*** [NORMAL MODE] ***

-- Source file
set_keymap('n', '<c-s>', ':luafile %<cr>', ns_opt)

-- No highlight
set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', ns_opt)

-- Explorer
set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', ns_opt)

-- Window movement
set_keymap('n', '<C-h>', '<C-w>h', ns_opt)
set_keymap('n', '<C-j>', '<C-w>j', ns_opt)
set_keymap('n', '<C-k>', '<C-w>k', ns_opt)
set_keymap('n', '<C-l>', '<C-w>l', ns_opt)

-- Navigate buffers
set_keymap('n', '<S-l>', ':bnext<CR>', ns_opt)
set_keymap('n', '<S-h>', ':bprevious<CR>', ns_opt)

-- Resize windows
set_keymap('n', '<C-Up>', ':resize -2<CR>', ns_opt)
set_keymap('n', '<C-Down>', ':resize +2<CR>', ns_opt)
set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', ns_opt)
set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', ns_opt)


-- 			*** [VISUAL MODE] ***

-- Visual indenting
set_keymap('v', '<', '<gv', ns_opt)
set_keymap('v', '>', '>gv', ns_opt)


-- 			*** [VISUAL BLOCK MODE] ***

-- Move selected line / block of text in visual mode
-- Shift + k / K to move up
-- Shift + j / J to move down
set_keymap('x', 'K', [[:move '<-2<CR>gv-gv]], ns_opt)
set_keymap('x', 'J', [[:move '>+1<CR>gv-gv]], ns_opt)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})
