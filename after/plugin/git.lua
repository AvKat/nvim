vim.keymap.set("n", "<leader>gs", function ()
    vim.cmd("tab G")
end)

vim.keymap.set("n", "<leader>df", vim.cmd.Gvdiffsplit)
