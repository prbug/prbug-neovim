return {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    { "saghen/blink.compat", opts = { enable_events = true } },
    {
      "Exafunction/codeium.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      opts = {},
    },
  },
  lazy = false,
  version = "*", -- use a release tag to download pre-built binaries
  opts = {
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" }, auto_show = true },
    },
    signature = { window = { border = "rounded" } },
    keymap = { preset = "enter" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "codeium" },
      providers = {
        codeium = {
          name = "codeium",
          module = "blink.compat.source",
          score_offset = 3,
          transform_items = function(_, items)
            for _, item in ipairs(items) do
              item.kind_icon = ""
              item.kind_name = "Codeium"
            end
            return items
          end,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust" },
  },
  opts_extend = { "sources.default" },
}
