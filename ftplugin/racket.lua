local utils = require "utils"
utils.bind_run_once('racket')
utils.bind_run_interactive('repl')

vim.opt.syntax = "scheme"
vim.opt.commentstring = ";; %s"

vim.cmd("let b:AutoPairs = {'(':')', '[':']', '{':'}','\"':'\"', '`':'`'}")
