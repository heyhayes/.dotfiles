return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    local statusline = require("mini.statusline")
    statusline.setup {
      use_icons = true
    }

    local minipairs = require("mini.pairs")
    minipairs.setup()

    local minisurround = require("mini.surround")
    minisurround.setup()

    local splitjoin = require("mini.splitjoin")
    splitjoin.setup()

    local comment = require("mini.comment")
    comment.setup({
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        end,
      },
    })
  end
}
