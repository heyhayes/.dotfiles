local set = vim.opt_local

set.shiftwidth = 4
set.tabstop = 4
set.number = true
set.relativenumber = true
set.signcolumn = "yes:2"
set.autoindent = true
set.expandtab = false

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false -- Start with folds open; toggle with `za`
