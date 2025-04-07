local M = {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
}

function M.config()
  vim.g.rustaceanvim = {
    tools = {
      float_window_config = { border = "rounded" },
      executor = {
        opts = {},
      },
      rustc = {},
    },
    server = {
      on_attach = function(client, bufnr)
        -- Set keybindings, etc. here.
        vim.keymap.set("n", "<leader>lj", function()
          vim.cmd.RustLsp({ "renderDiagnostic", "cycle" })
        end, { silent = true, buffer = bufnr })
        vim.keymap.set("n", "<leader>lh", function()
          vim.cmd.RustLsp({ "renderDiagnostic", "current" })
        end, { silent = true, buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {},
      },
    },
    dap = {},
  }
end

return M
