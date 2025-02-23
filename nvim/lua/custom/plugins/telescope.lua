return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require("telescope").setup {
      defaults = {
        path_display = { truncate = 1 },
        prompt_prefix = '   ',
        selection_caret = '  ',
        layout_config = {
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending'
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        },
      },
      pickers = {
        find_files = {
          theme = "ivy",
          hidden = true,
        },
        buffers = {
          theme = "ivy"
        }
      }
    }
    vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers)
    vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags)
    vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files)
    vim.keymap.set("n", "<leader>sn", function()
      require("telescope.builtin").find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
    vim.keymap.set("n", "<leader>sp", function()
      require("telescope.builtin").find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)
    require('telescope').load_extension('fzf')
    require "config.telescope.multigrep".setup()
  end

}
