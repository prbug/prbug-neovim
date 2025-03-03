local M = { "nvimtools/none-ls.nvim", dependencies = { "nvimtools/none-ls-extras.nvim", "nvim-lua/plenary.nvim" } }

function M.config()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local completion = null_ls.builtins.completion

  null_ls.setup({
    sources = {
      -- lua
      formatting.stylua.with({
        extra_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--column-width",
          "120",
        },
      }),

      -- javascript
      require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim

      -- spell completion
      null_ls.builtins.completion.spell,
    },
  })
end

return M
