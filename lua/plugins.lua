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
    version = "0.1.2",
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { 'TSUpdate' },
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    version = 'nightly'              -- optional, updated every week. (see issue #1193)
  },
  {
    'Julian/lean.nvim',
    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    },
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
  'gosukiwi/vim-atom-dark',
  'christoomey/vim-tmux-navigator',
  'sainnhe/sonokai',
  'jdsimcoe/abstract.vim',
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
  -- 'SirVer/ultisnips',
  -- {
  --   'neoclide/coc.nvim',
  --   branch = 'master',
  --   build = 'yarn install --frozen-lockfile'
  -- },
  {
    'kaarmu/typst.vim',
    ft = { 'typst' }
  },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { "hrsh7th/nvim-cmp" },
  -- { 'ranjithshegde/ccls.nvim' },
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
  },
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp"
  },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'whonore/Coqtail' }
})
