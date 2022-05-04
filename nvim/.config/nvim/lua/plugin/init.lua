local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever I save this file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugin/init.lua so <afile> | PackerSync
]] -- THIS KINDA SUCK FOR ME!!! I NEED TO CHANGE LATER

-- Use a protected call so that I don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
	return
end
-- Test
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Nvim tree: File Explorer
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    }
	}
	-- Collection of configurations for the built-in LSP client
	use 'neovim/nvim-lspconfig'

	if packer_bootstrap then
		require('packer').sync()
	end

	-- ---------------- --
	-- Require packages --
	require'nvim-tree'.setup()
end)
