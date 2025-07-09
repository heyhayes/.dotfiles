return {
  "augmentcode/augment.vim",
  init = function()
    vim.g.augment_node_command = "/Users/davidhayes/.nvm/versions/node/v24.1.0/bin/node"
  end,
  config = function()
    vim.g.augment_node_command = "/Users/davidhayes/.nvm/versions/node/v24.1.0/bin/node"
    vim.g.augment_workspace_folders =
      { "~/Development/Work/classmanager/backend/src/", "~/Development/Work/classmanager/frontend/" }
    vim.keymap.set("n", "<Leader>ae", function()
      vim.g.augment_disable_completions = false
    end)
    vim.keymap.set("n", "<Leader>ad", function()
      vim.g.augment_disable_completions = true
    end)
  end,
}
