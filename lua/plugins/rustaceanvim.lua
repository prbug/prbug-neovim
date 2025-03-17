local M = { "mrcjkb/rustaceanvim", version = "^5", lazy = false }

function M.config()
  vim.g.rustaceanvim = {
    tools = {},
    -- lsp config
    server = {
      cmd = { "rust-analyzer" },
      on_attach = function(client, bufnr)
        -- put keymaps here
      end,
      default_settings = {
        -- language server config
        ["rust-analyzer"] = {},
      },
    },
    -- dap config
    dap = {},
  }
end

return M
