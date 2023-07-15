require("mappings")
require("plugins")
require("set")

vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert'
})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*.rkt',
    command = 'set filetype=racket'
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*.typ',
    command = 'set filetype=typst'
})

vim.keymap.set('t', '<Tab>', function ()
  vim.cmd('TablineBufferNext')
end, {noremap = true})
