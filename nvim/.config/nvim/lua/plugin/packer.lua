local prequire =  require("helper").prequire
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
		autocmd BufWritePost packer.lua source <afile> | PackerSync
]] -- I THINK THERE ARE SOME WAY BETTER ?

local packer = prequire('packer')
if not packer then
	return
end

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    -- Colorscheme plugins
    use 'folke/tokyonight.nvim'
	-- Nvim tree: File Explorer
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    }
	}
	-- Completion plugins
	use {
		-- Completion Engine
		'hrsh7th/nvim-cmp',	
		-- Completion Sources
		'hrsh7th/cmp-nvim-lsp',		-- Completions for our LSP (our languages)
		'hrsh7th/cmp-nvim-lua',		-- Lua completions
		'hrsh7th/cmp-buffer',		-- Buffer completions
		'hrsh7th/cmp-path',		-- Path completions
		'hrsh7th/cmp-cmdline',		-- Cmdline completions
		'saadparwaiz1/cmp_luasnip',	-- Luasnip completions
	}
	-- Snippet plugins
	use {
		-- Snippet Engine
		'L3MON4D3/LuaSnip',
		-- A bunch of snippets for a set of different programming languages
		'rafamadriz/friendly-snippets',
	}
	-- Collection of configurations for the built-in LSP client
	use 'neovim/nvim-lspconfig'
	-- GUI plugin for lsp, works in tandem with 'nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	-- Icon plugins
	use {
		'onsails/lspkind.nvim'
	}
	if packer_bootstrap then
		require('packer').sync()
	end

	-- ---------------- --
	-- Require packages --
	require'nvim-tree'.setup()
end)
