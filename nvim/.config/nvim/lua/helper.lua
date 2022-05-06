local M = {}

local is_windows = vim.loop.os_uname().version:match 'Windows'



-- 			HELPER FUNCTIONs
local function prequire(...)
	local status, lib = pcall(require, ...)
	if (status) then return lib end
	return nil
end

local function join_paths(...)
	local path_sep = is_windows and '\\' or '/'
	local result = table.concat({ ... }, path_sep)
	return result
end

-- 			HELPER VARIABLEs
local root_path = vim.fn.stdpath('config')
local lua_path = join_paths(root_path, 'lua')
local paths = {
	root = root_path,
	lua = lua_path,
	lsp = join_paths(lua_path, 'lsp'),
	lsp_server = join_paths(lua_path, 'lsp', 'server'),
}
-- 			Assign for M
M.paths = paths
M.join_paths = join_paths
M.prequire = prequire
return M
