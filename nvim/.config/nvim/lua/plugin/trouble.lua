-- Lua
vim.keymap.set("n", "<Leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<Leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<Leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<Leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<Leader>xl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
