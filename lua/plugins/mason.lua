local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

function M.config()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "pyright",
    },
    ui = {
      border = "rounded",
    },
  })
end

return M
