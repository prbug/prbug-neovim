local M = { "nvimtools/none-ls.nvim", dependencies = { "nvimtools/none-ls-extras.nvim", "nvim-lua/plenary.nvim" } }

function M.config()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local completion = null_ls.builtins.completion
  local sql_formatter_config_file = os.getenv("HOME") .. "/.config/nvim/lua/plugins/sql-formatter-config.json"
  -- local sqruff_config_file = os.getenv("HOME") .. "/.config/nvim/lua/plugins/sqruff-config.toml"

  null_ls.setup({
    sources = {
      -- javascript
      require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      -- diagnostics.eslint_d,
      formatting.prettierd,

      -- css
      diagnostics.stylelint,

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

      -- python (now all managed by ruff in lspconfig.lua)
      -- diagnostics.pylint,
      -- formatting.isort,
      -- formatting.black.with({
      --   extra_args = { "--line-length=80" },
      -- }),

      -- spell completion
      completion.spell,

      -- sql
      -- formatting.sqlfmt,
      formatting.sql_formatter.with({
        args = { "--config", sql_formatter_config_file },
      }),

      -- go
      formatting.goimports,
    },
  })
end

return M
