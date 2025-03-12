local M = {
   "catppuccin/nvim", name = "catppuccin", priority = 1000
  -- "folke/tokyonight.nvim", name = "tokyonight", priority = 1000
  -- "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000
}

function M.config()
  require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    color_overrides = {
      mocha = {
        rosewater = "#ffc9c9",
        flamingo = "#ff9f9a",
        pink = "#ffa9c9",
        mauve = "#e68ad2",
        lavender = "#ba8ae6",
        red = "#ba3f1d",
        maroon = "#f26d95",
        peach = "#f89595",
        yellow = "#ffbe69",
        green = "#afc3ac",
        teal = "#44909c",
        sky = "#a0d0c0",
        sapphire = "#8dd1da",
        blue = "#7ba2e0",
        text = "#ebc0ff",
        subtext1 = "#a6b0d8",
        subtext0 = "#959ec2",
        overlay2 = "#848cad",
        overlay1 = "#717997",
        overlay0 = "#63677f",
        surface2 = "#505469",
        surface1 = "#3e4255",
        surface0 = "#2c2f40",
        base = "#151515",
        mantle = "#0e0e0e",
        crust = "#080808",
      },
    },
    term_colors = true,
  })
  vim.cmd.colorscheme("catppuccin")

  -- require("tokyonight").setup({
  --   style = "storm",
  --   transparent = true,
  --   -- italic_comments = true,
  --   -- italic_keywords = true,
  --   -- italic_functions = true,
  --   -- italic_variables = true,
  --   dark_sidebar = false,
  --   dark_float = false,
  --   -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
  -- })
  -- vim.cmd.colorscheme("tokyonight")

  -- require("kanagawa").setup({
  --   transparent = true,
  --   colors = { theme = { all = { ui = { bg_gutter = "none", bg_m3 = "none" } } } },
  --   overrides = function()
  --     return {
  --       NormalFloat = { bg = "none" },
  --       FloatBorder = { bg = "none" },
  --       FloatTitle = { bg = "none" },
  --     }
  --   end,
  -- })
  -- vim.cmd.colorscheme("kanagawa")

  vim.o.cursorline = false
  vim.opt.titlestring = "neovim"
  vim.opt.title = true
end

return M
