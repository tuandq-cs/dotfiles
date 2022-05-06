local prequire = require("helper").prequire

local lspconfig = prequire("lspconfig")
local cmp_nvim_lsp = prequire('cmp_nvim_lsp')

if not (lspconfig and cmp_nvim_lsp) then
	return 
end

local function on_attach(client, bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Default options
local default_opt = {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
	-- TODO: Complete this one
	local server_opt = {}
	local opt = vim.tbl_deep_extend("force", server_opt, default_opt)
	lspconfig[lsp].setup(opt)
end
