local M = {
  "zaldih/themery.nvim",
  name = "themery",
  lazy = false,
}

function M.config()
  -- default theme
  vim.g.colorscheme = "catppuccin"

  -- theme switcher
  local themery = require("themery")
  themery.setup({
    themes = {
      "catppuccin",
      { name = "rose-pine", colorscheme = "rose-pine-moon" },
      {
        name = "starry (moonlight)",
        colorscheme = "starry",
        before = [[
          require("starry").setup({ style = { name = "moonlight" } })
          vim.g.starry_italic_comments = true
        ]],
      },
      {
        name = "starry (dracula)",
        colorscheme = "starry",
        before = [[
          require("starry").setup({ style = { name = "dracula" } })
          vim.g.starry_italic_comments = true
        ]],
      },
      {
        name = "starry (dracula blood)",
        colorscheme = "starry",
        before = [[
          require("starry").setup({ style = { name = "dracula_blood" } })
          vim.g.starry_italic_comments = true
        ]],
      },
      {
        name = "starry (middlenight)",
        colorscheme = "starry",
        before = [[
          require("starry").setup({ style = { name = "middlenight_blue" } })
          vim.g.starry_italic_comments = true
        ]],
      },
      {
        name = "starry (early summer)",
        colorscheme = "starry",
        before = [[
          require("starry").setup({ style = { name = "earlysummer" } })
          vim.g.starry_italic_comments = true
        ]],
      },
      {
        name = "starry (dark solar)",
        colorscheme = "starry",
        before = [[
          require("starry").setup({ style = { name = "dark_solar" } })
          vim.g.starry_italic_comments = true
        ]],
      },
    },
    globalAfter = [[ require("sttusline").setup({ statusline_color = "none" }) ]],
    livePreview = true,
  })

  -- vim.o.cursorline = false
  -- vim.opt.titlestring = "neovim"
  -- vim.opt.title = true
end

return M
