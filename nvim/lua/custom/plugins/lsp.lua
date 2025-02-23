return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "gbprod/none-ls-php.nvim"
      },
    },
    'saghen/blink.cmp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
      gopls = {
      },
      phpcs = {
      },
      intelephense = {
        root_dir = require("lspconfig").util.root_pattern(".git", "package.json"),
        settings = {
          intelephense = {
            files = {
              maxSize = 10000000,
              associations = {
                "*.php",
                "*.phtml",
                "*.inc",
                "*.api"
              }
            },
            environment = {
              shortOpenTag = true
            },
            client = {
              disableInlayHints = false
            }
          }
        }
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    ---@diagnostic disable-next-line: missing-fields
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    local null_ls = require("null-ls")

    null_ls.setup {
      sources = {
        require("none-ls-php.diagnostics.php"),
      }
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        vim.diagnostic.config { virtual_text = true, virtual_lines = false }


        if client:supports_method('textDocument/formatting') then
          -- Format the current buffer on save
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              print("Formatting Buffer")
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end
      end,
    })
  end
}
