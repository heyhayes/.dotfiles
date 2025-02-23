vim.g.mapleader = " "

require("config.lazy")
require("custom.options")
require("custom.keymaps")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight when yanking test",
  group = vim.api.nvim_create_augroup("dmh_highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("PhpFiles", { clear = true }),
  pattern = { "*.inc", "*.api" },
  callback = function()
    vim.cmd('set filetype=php')
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup("dh-custom-term", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.keymap.set("n", "<leader>ts", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.setqflist()
  vim.cmd.cwindow()
end)
