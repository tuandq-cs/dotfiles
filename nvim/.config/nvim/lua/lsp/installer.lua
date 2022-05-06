local prequire = require("helper").prequire

local lsp_installer = prequire("nvim-lsp-installer")
if not lsp_installer then
	return
end

lsp_installer.setup{}
