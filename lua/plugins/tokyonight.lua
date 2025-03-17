local M = { "folke/tokyonight.nvim", name = "tokyonight", priority = 1000 }

function M.config()
  require("tokyonight").setup({})
end

return M
