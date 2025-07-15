return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason.nvim",
      "mfussenegger/nvim-dap",
    },
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_setup = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
        php = function(config)
          config.configurations = {
            {
              type = "php",
              request = "launch",
              name = "Listen for Xdebug",
              port = 9003,
              pathMappings = {
                ["${workspaceFolder}"] = "${workspaceFolder}",
                ["/var/www/html"] = "${workspaceFolder}",
              },
            },
          }
          require("mason-nvim-dap").default_setup(config)
        end,
      },
      ensure_installed = {
        "php",
        "bash",
        "python",
        "delve",
      },
    },
    config = function()
      local dap = require("dap")

      -- Debug control
      vim.keymap.set("n", "dc", dap.continue, { desc = "Debug: Continue" })
      vim.keymap.set("n", "ds", dap.step_over, { desc = "Debug: Step Over" })
      vim.keymap.set("n", "di", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "do", dap.step_out, { desc = "Debug: Step Out" })

      -- Breakpoints
      vim.keymap.set("n", "db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: Conditional Breakpoint" })

      -- Debug session management
      vim.keymap.set("n", "dr", dap.repl.open, { desc = "Debug: Open REPL" })
      vim.keymap.set("n", "dt", dap.terminate, { desc = "Debug: Terminate" })
    end,
  },

  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dap-go").setup()

      vim.keymap.set("n", "dgt", function()
        dapui.open()
        require("dap-go").debug_test()
      end, { desc = "Debug: Go Test" })

      vim.keymap.set("n", "dgl", function()
        dapui.open()
        require("dap-go").debug_last_test()
      end, { desc = "Debug: Go Last Test" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Optional keymaps
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle UI" })
      vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Debug: Eval Expression" })
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
