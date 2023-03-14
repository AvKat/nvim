local utils = {}

function utils.bind_run_once (cmd)
    vim.keymap.set(
    'n',
    '<F10>',
    (':vsplit term://%s %s<CR>'):format(cmd, vim.fn.shellescape(vim.fn.expand('%')))
    , {noremap = true, silent = true})
end

function utils.bind_run_interactive(cmd)
    vim.keymap.set(
    'n',
    '<F11>',
    (':vsplit term://%s %s<CR>'):format(cmd, vim.fn.shellescape(vim.fn.expand('%')))
    , {noremap = true, silent = true})
end

return utils