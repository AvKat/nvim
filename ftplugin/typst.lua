vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
vim.keymap.set('i', '<C-o>', '<Plug>(coc-snippets-expand)')
vim.cmd('let b:AutoPairs = {"(":")", "[":"]", "{":"}", \'"\':\'"\', "`":"`", "\'":"\'", "$":"$", "|":"|"}')

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    pattern = '*.typ',
    callback = function()
        vim.opt.spell = true
        vim.opt.spelllang = 'en_us'
    end
})
