return {
  "tpope/vim-projectionist",
  dependencies = "tpope/vim-dispatch",
  config = function()
    require("custom.config.plugins.projectionist")
  end,
}
