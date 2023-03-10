vim.keymap.set('n', '<F10>', ':vsplit term://racket %<CR>')
vim.keymap.set('n', '<F11>', ':vsplit term://repl %<CR>')

vim.opt.syntax = "scheme"
vim.opt.commentstring = ";; %s"

vim.cmd("let b:AutoPairs = {'(':')', '[':']', '{':'}','\"':'\"', '`':'`'}")
