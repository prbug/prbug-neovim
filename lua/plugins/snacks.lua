local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
}

function M.config()
  Snacks = require("snacks")
  Snacks.setup({
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
    },
    git = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true, config = true },
    notifier = {
      enabled = false,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      matcher = { cwd_bonus = true },
      projects = {
        matcher = { cwd_bonus = true },
      },
      sources = {
        explorer = {
          enabled = true,
          hidden = true,
          auto_close = false,
          win = {
            list = {
              keys = {
                ["o"] = { "o", { "pick_win", "jump" }, mode = { "n", "i" } },
                ["<enter>"] = { "<enter>", { "pick_win", "jump" }, mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
    words = { enabled = true },
    -- ui = { wrap = false },
    zen = {
      toggles = {
        dim = false,
        git_signs = true,
        mini_diff_signs = true,
        diagnistics = true,
        -- inlay_hints = true,
      },
      show = {
        statusline = true,
      },
      win = { backdrop = { transparent = false, blend = 99 } },
    },
  })
  -- UI keymaps live here, but all others will live in whichkey
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      -- Setup some globals for debugging (lazy-loaded)
      _G.dd = function(...)
        Snacks.debug.inspect(...)
      end
      _G.bt = function()
        Snacks.debug.backtrace()
      end
      vim.print = _G.dd -- Override print to use snacks for `:=` command

      -- Create some toggle mappings
      Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
      Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
      Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
      Snacks.toggle.diagnostics():map("<leader>ud")
      Snacks.toggle.line_number():map("<leader>ul")
      Snacks.toggle
        .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
        :map("<leader>uc")
      Snacks.toggle.treesitter():map("<leader>uT")
      Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
      Snacks.toggle.inlay_hints():map("<leader>uh")
      Snacks.toggle.indent():map("<leader>ug")
      Snacks.toggle.dim():map("<leader>uD")
    end,
  })
end

return M
