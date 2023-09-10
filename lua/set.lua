local utils = require "utils"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard="unnamed"
vim.opt.mouse = 'nvc'

vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.foldlevel = 4


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.splitright = true

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_create_user_command("ChangeRunCommand", function ()
  local cmd = vim.fn.input("Enter new command: ")
  if cmd == "" then
    return
  end
  local hasFileName = vim.fn.input("Has file name? (0/1): ")
  utils.change_run_cmd(cmd, hasFileName)
end, {})

vim.api.nvim_create_user_command("ChangeInteractiveCommand", function ()
  local cmd = vim.fn.input("Enter new command: ")
  if cmd == "" then
    return
  end
  local hasFileName = vim.fn.input("Has file name? (0/1): ")
  utils.change_interactive_cmd(cmd, hasFileName)
end, {})

vim.api.nvim_create_user_command("Reload", function ()
  vim.cmd("source ~/.config/nvim/init.lua")
end, {})
