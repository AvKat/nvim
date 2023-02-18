-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		require("rose-pine").setup()
	end
})

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('joshdick/onedark.vim')


use {
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	},
	tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}


end)

