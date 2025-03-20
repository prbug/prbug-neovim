local M = { "catppuccin/nvim", name = "catppuccin", priority = 1000 }

function M.config()
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    -- no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
      all = {
        rosewater = "#ffc9c9",
        flamingo = "#ff9f9a",
        pink = "#fab6ca",
        mauve = "#f79cb6",
        lavender = "#c4a7e7",
        red = "#ba3f1d",
        maroon = "#b4637a",
        peach = "#ea9a97",
        yellow = "#f6c177",
        green = "#aed0a0",
        teal = "#44909c",
        sky = "#9ccfd8",
        sapphire = "#8dd1da",
        blue = "#6ab3eb",
        text = "#e0def4",
        subtext1 = "#a6b0d8",
        subtext0 = "#959ec2",
        overlay2 = "#848cad",
        overlay1 = "#717997",
        overlay0 = "#63677f",
        surface2 = "#505469",
        surface1 = "#3e4255",
        surface0 = "#2c2f40",
        -- base = "#151515",
        -- mantle = "#0e0e0e",
        -- crust = "#080808",
      },
    },
    custom_highlights = function(colors)
      return {
        FloatBorder = { bg = colors.mantle },
        Comment = { fg = colors.surface2, style = { "italic" } },
        WinSeparator = { fg = colors.surface1 },
        ["@type.builtin"] = {  style = { "bold" } },
        ["@string.documentation"] = { fg = colors.overlay1, style = { "italic" } },
        ["@variable.parameter"] = { style = { "italic" } },
        ["@variable.builtin"] = { fg = colors.maroon, style = { "italic", "bold" } },
        ["@punctuation.bracket"] = { fg = colors.overlay0 },
        ["@constant.builtin"] = { style = { "italic", "bold" } },
        ["@keyword.return"] = { style = { "italic" } },
      }
    end,
    integrations = {
      snacks = { enabled = true },
      noice = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
end

return M
