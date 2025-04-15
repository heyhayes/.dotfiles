return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        config = function()
          require("luasnip/loaders/from_snipmate").lazy_load()
        end,
      },
      "rafamadriz/friendly-snippets",
    },

    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["C-k"] = { "show", "show_documentation", "hide_documentation" },
        ["C-space"] = {},
      },
      cmdline = {
        keymap = {
          preset = "super-tab",
          ["<Tab>"] = { "show", "accept" },
        },
        completion = {
          ghost_text = { enabled = true },
          menu = { auto_show = true },
        },
      },
      term = {
        keymap = { preset = "super-tab" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true, window = { border = "none" } },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },
}
