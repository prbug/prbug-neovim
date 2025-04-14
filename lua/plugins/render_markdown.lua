local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "echasnovski/mini.nvim",
    "Saghen/blink.cmp",
  }, -- if you use the mini.nvim suite
}

function M.config()
  require("render-markdown").setup({
    completions = { blink = { enabled = true } },
  })
end

return M
