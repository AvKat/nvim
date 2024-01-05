vim.g.UltiSnipsExpandTrigger = "<C-I>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
vim.g.UltiSnipsEditSplit = "vertical"

vim.api.nvim_set_keymap("i", "<C-I>", "v:lua.tab_complete()", { expr = true })
