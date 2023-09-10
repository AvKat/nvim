vim.opt.spell = true
vim.opt.spelllang = 'en_us'
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')
vim.cmd('let b:AutoPairs = {"(":")", "[":"]", "{":"}", \'"\':\'"\', "\'":"\'", "$":"$", "|":"|"}')

-- $$ text objects from vim-latec-objects
vim.keymap.set('v', 'im', '<ESC>:call SelectInMath(0)<CR>')
vim.keymap.set('v', 'am', '<ESC>:call SelectInMath(1)<CR>')
vim.keymap.set('o', 'im', ':normal vim<CR>')
vim.keymap.set('o', 'am', ':normal vam<CR>')

-- Open pdf and run typst watch
function _G.TypstWatch()
  vim.g.VimuxOrientation = 'v'
  vim.fn["VimuxOpenRunner"]()
  vim.g.VimuxOrientation = 'h'

  vim.fn["VimuxRunCommand"](('typst watch %s'):format(vim.fn.expand('%')))
end

function _G.OpenPdfSioyek()
  local pdfName = vim.fn.expand('%'):gsub('%.typ$', '.pdf')
  if vim.fn.filereadable(pdfName) == 0 then
    print('No pdf file found')
    return
  end
  vim.fn.jobstart(
    ('sioyek %s'):format(pdfName)
  )
end


TypstWatch()
OpenPdfSioyek()

vim.api.nvim_create_user_command('MyTypstWatch', TypstWatch, {})
vim.api.nvim_create_user_command('OpenPdfSioyek', OpenPdfSioyek, {})


vim.api.nvim_create_autocmd({ 'BufUnload' }, {
  pattern = '*.typ',
  callback = function()
    vim.fn['VimuxSendKeys']("C-C")
    vim.fn['VimuxCloseRunner']()
    -- vim.fn['VimuxClearTerminalScreen']()
  end
})
