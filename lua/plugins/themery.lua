local M = {
  "zaldih/themery.nvim",
  name = "themery",
  lazy = false,
  priority = 1000,
}

function M.config()
  -- autocmd to force transparent status line
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      -- Basic statusline highlights
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

      -- Heirline component highlights - override ALL of them
      for _, group in ipairs(vim.fn.getcompletion("Heirline", "highlight")) do
        local current = vim.api.nvim_get_hl(0, { name = group })
        current.bg = "NONE" -- Force transparent background
        vim.api.nvim_set_hl(0, group, current)
      end
    end,
    pattern = "*",
  })

  -- default theme
  vim.g.colorscheme = "catppuccin"

  -- theme switcher
  require("themery").setup({
    themes = {
      "catppuccin",
      -- "tokyonight-night",
      -- "tokyonight-storm",
      {
        name = "tokyonight",
        colorscheme = "tokyonight-moon",
        after = [[ require("tokyonight.colors").setup() ]],
      },
      { name = "rose-pine", colorscheme = "rose-pine-moon" },
    },
    livePreview = true,
    globalAfter = [[ vim.cmd("doautocmd ColorScheme") ]],
  })

  -- vim.o.cursorline = false
  -- vim.opt.titlestring = "neovim"
  -- vim.opt.title = true
end

return M
