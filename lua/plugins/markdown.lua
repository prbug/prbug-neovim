local M = {
  "tadmccorkle/markdown.nvim",
  event = "VeryLazy",
}

function M.config()
  require("markdown").setup({})
end

return M
