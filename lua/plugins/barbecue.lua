local M = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
}

function M.config()
  require("barbecue").setup {
    theme = { basename = { fg = "#fafafa", bold = true } },
    show_modified = true,
    context_follow_icon_color = true,
  }
end

return M
