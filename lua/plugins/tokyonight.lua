local M = { "folke/tokyonight.nvim", name = "tokyonight", priority = 1000 }

local function set_color(identifier, color)
  vim.api.nvim_set_hl(0, identifier, { fg = color })
end

function M.config()
  require("tokyonight").setup({
    on_colors = function(colors)
      colors.bg = "#222436"
      colors.bg_dark = "#1e2030"
      colors.bg_dark1 = "#191B29"
      colors.bg_highlight = "#2f334d"
      colors.blue = "#82aaff"
      colors.blue0 = "#3e68d7"
      colors.blue1 = "#65bcff"
      colors.blue2 = "#0db9d7"
      colors.blue5 = "#89ddff"
      colors.blue6 = "#b4f9f8"
      colors.blue7 = "#394b70"
      colors.comment = "#636da6"
      colors.cyan = "#86e1fc"
      colors.dark3 = "#545c7e"
      colors.dark5 = "#737aa2"
      colors.fg = "#c8d3f5"
      colors.fg_dark = "#828bb8"
      colors.fg_gutter = "#3b4261"
      colors.green = "#c5e09d"
      colors.green1 = "#4fd6be"
      colors.green2 = "#41a6b5"
      colors.magenta = "#c099ff"
      colors.magenta2 = "#ff007c"
      colors.orange = "#ff966c"
      colors.purple = "#fca7ea"
      colors.red = "#ff757f"
      colors.red1 = "#c53b53"
      colors.teal = "#4fd6be"
      colors.terminal_black = "#444a73"
      colors.yellow = "#ffc777"
      colors.git.add = colors.green
      colors.git.change = colors.yellow
      colors.git.delete = colors.red
      set_color("@operator", colors.fg_dark)
      set_color("@comment", colors.blue7)
      set_color("@punctuation.delimiter", colors.fg_dark)
      set_color("@string.documentation", colors.comment)
      set_color("WinSeparator", colors.fg_gutter)
    end,
  })
end

return M
