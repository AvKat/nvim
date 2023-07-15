vim.keymap.set("n", "<leader>gs", function ()
    vim.cmd("vert G")
end)

vim.keymap.set("n", "<leader>df", vim.cmd.Gvdiffsplit)
