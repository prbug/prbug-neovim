local M = {
  "williamboman/mason.nvim",
  opts = {
    ui = {
      border = "rounded",
    },
  },
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
  })
end

return M
