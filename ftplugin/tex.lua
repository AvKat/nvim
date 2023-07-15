vim.opt.conceallevel = 2
vim.g.tex_flavor = 'latex'
-- vim.g.tex_conceal = 'abdmgs'
vim.g.tex_conceal = ''
-- vim.g.vimtex_syntax_conceal = {
--     math_delimiters= 1,
--     math_bounds=0,
--     math_symbols=0,
--     fancy= 1,
--     accents = 1,
--     ligatures = 1,
--     math_fracs = 1,
--     greek = 1
-- }

vim.cmd('let b:AutoPairs = {"(":")", "[":"]", "{":"}", \'"\':\'"\', "`":"`", "\'":"\'", "$":"$", "|":"|"}')
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.cmd('VimtexCompile')
vim.cmd("sleep 1000m")

local tex_au = vim.api.nvim_create_augroup('tex_au', {clear = true})
vim.api.nvim_create_autocmd({ 'BufUnload' }, {
    group = "tex_au",
    pattern = '*.tex',
    callback = function()
        vim.cmd('call vimtex#compiler#clean(0)')
    end
})

vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
vim.keymap.set('i', '<C-o>', '<Plug>(coc-snippets-expand)')
