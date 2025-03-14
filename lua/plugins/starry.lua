local M = { "ray-x/starry.nvim", priority = 1000 }

function M.config()
  require("starry").setup({
    border = false,
    disable = { background = true },
    style = { name = "moonlight" },
  })
end

return M
