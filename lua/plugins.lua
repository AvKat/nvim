local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  "folke/lazy.nvim",
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { 'TSUpdate' },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    version = 'nightly' -- optional, updated every week. (see issue #1193)
  },
  'vim-airline/vim-airline',
  'tmhedberg/SimpylFold',
  'tpope/vim-surround',
  'numToStr/Comment.nvim',
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  'lukas-reineke/indent-blankline.nvim',
  'joshdick/onedark.vim',
  'ghifarit53/tokyonight-vim',
  'tiagovla/tokyodark.nvim',
  'lewis6991/moonlight.vim',
  'ayu-theme/ayu-vim',
  'gosukiwi/vim-atom-dark',
  'christoomey/vim-tmux-navigator',
  'preservim/vimux',
  'edkolev/tmuxline.vim',
  'gibiansky/vim-latex-objects',
  'jiangmiao/auto-pairs',
  'alvan/vim-closetag',
  'norcalli/nvim-colorizer.lua',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'github/copilot.vim',
  'lervag/vimtex',
  'SirVer/ultisnips',
  {
    'neoclide/coc.nvim',
    branch = 'master',
    build = 'yarn install --frozen-lockfile'
  },
  {
    'kaarmu/typst.vim',
    ft = {'typst'}
  },
  -- {
  --   'nvarner/typst-lsp',
  --   ft = {'typst'}
  -- },
})

