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
    -- no_italic = false, -- Force no italic
    -- no_bold = false, -- Force no bold
    -- no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
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
        -- subtext1 = "#a6b0d8",
        -- subtext0 = "#959ec2",
        -- overlay2 = "#848cad",
        -- overlay1 = "#717997",
        -- overlay0 = "#63677f",
        -- surface2 = "#505469",
        -- surface1 = "#3e4255",
        -- surface0 = "#2c2f40",
        -- base = "#151515",
        -- mantle = "#0e0e0e",
        -- crust = "#080808",
      },
    },
    custom_highlights = function(colors)
      return {
        FloatBorder = { bg = colors.mantle },
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
