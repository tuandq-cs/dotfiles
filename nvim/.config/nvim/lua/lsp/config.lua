local helper = require('helper')


-- Safe import hereeeeee
local lspconfig = helper.prequire("lspconfig")
local cmp_nvim_lsp = helper.prequire('cmp_nvim_lsp')

if not (lspconfig and cmp_nvim_lsp) then
	return
end


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
-- Define default options
local default_opt = {
	--on_attach = on_attach,
	capabilities = capabilities,
}

-- Enable language servers from folder 'server' with the additional completion capabilities offered by nvim-cmp
local server_paths = vim.fn.globpath(helper.paths.lsp_server, '*.lua')
server_paths = vim.fn.split(server_paths, '\n') -- Split them
for _, server_path in pairs(server_paths) do
	local server_name = vim.fn.fnamemodify(server_path, ':t:r')
	local server_opt = helper.prequire(string.format('lsp.server.%s', server_name))
	server_opt = type(server_opt) == 'table' and server_opt or {}
	server_opt = vim.tbl_deep_extend("force", server_opt, default_opt)
	lspconfig[server_name].setup(server_opt)
end
