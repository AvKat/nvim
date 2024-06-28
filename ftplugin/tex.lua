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


function _G.OpenPdfSioyek()
  local pdfName = vim.fn.expand('%'):gsub('%.tex$', '.pdf')
  if vim.fn.filereadable(pdfName) == 0 then
    print('No pdf file found')
    return
  end
  vim.fn.jobstart(
    ('sioyek %s'):format(pdfName)
  )
end

vim.api.nvim_create_user_command('OpenPdfSioyek', OpenPdfSioyek, {})

local tex_au = vim.api.nvim_create_augroup('tex_au', { clear = true })
vim.api.nvim_create_autocmd({ 'BufUnload' }, {
  group = "tex_au",
  pattern = '*.tex',
  callback = function()
    vim.cmd('call vimtex#compiler#clean(0)')
  end
})

vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
