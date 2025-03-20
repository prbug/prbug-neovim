local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

function M.config()
  require("mason").setup({
    ui = { border = "rounded" },
  })
  require("mason-lspconfig").setup({
    ensure_installed = {
      "pyright",
      "rust_analyzer",
    },
  })
end

return M
