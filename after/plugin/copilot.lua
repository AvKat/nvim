vim.g.copilot_filetypes = {racket = false, tex = false, c = false, haskell = false, cpp = false, typst = false}
vim.g.copilot_no_tab_map = true
vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("\\<CR>")')
vim.keymap.set('n', '<leader>cdb', ':Copilot disable<CR>')
