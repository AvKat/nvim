local utils = {}

function utils.bind_run_once (cmd)
    vim.keymap.set(
    'n',
    '<leader>rr',
    (':call VimuxRunCommand("%s %s")<CR>'):format(cmd, vim.fn.expand('%')),
    -- (':vsplit term://%s %s<CR>'):format(cmd, vim.fn.shellescape(vim.fn.expand('%'))),
    {noremap = true, silent = true, buffer = true})
end

function utils.bind_run_interactive(cmd)
    vim.keymap.set(
    'n',
    '<leader>re',
    (':call VimuxRunCommand("%s %s")<CR>'):format(cmd, vim.fn.expand('%')),
    -- (':vsplit term://%s %s<CR>'):format(cmd, vim.fn.shellescape(vim.fn.expand('%')))
    , {noremap = true, silent = true, buffer = true})
end

return utils
