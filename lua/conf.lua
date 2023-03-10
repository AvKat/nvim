vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '*',
    command = 'startinsert'
})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.keymap.set('t', '<Tab>', function ()
  vim.cmd('TablineBufferNext')
end, {noremap = true})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*.rkt',
    command = 'set filetype=racket'
})
