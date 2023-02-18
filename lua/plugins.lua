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

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

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

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use('joshdick/onedark.vim')
use('ghifarit53/tokyonight-vim')
use('tiagovla/tokyodark.nvim')
use('lewis6991/moonlight.vim')
use('ayu-theme/ayu-vim')
use('gosukiwi/vim-atom-dark')
-- Plug 'HerringtonDarkholme/yats.vim'
--
-- Navigate with C-h C-l C-j C-k
use('christoomey/vim-tmux-navigator')
-- Stable version of coc
use('neoclide/coc.nvim', { branch = "release"})
use( 'vim-scripts/c.vim')
 -- use('wlangstroth/vim-racket')
-- Close pairs () [] {} ''
use('jiangmiao/auto-pairs')
use('alvan/vim-closetag')
-- "colorizer plugin for #fe4918
use('norcalli/nvim-colorizer.lua')
-- Have the indent lines
use( 'yggdroot/indentline')
-- Git Integration ______________
use( 'tpope/vim-fugitive')
use('airblade/vim-gitgutter')
-- Copilot
use( 'github/copilot.vim')
-- Tex
use('lervag/vimtex')
-- use('KeitaNakamura/tex-conceal.vim', { ft = "tex"})
use('SirVer/ultisnips')

end)

