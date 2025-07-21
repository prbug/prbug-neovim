local M = {
  "azorng/goose.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
      },
    },
  },
}

function M.config()
  require("goose").setup({})

  -- Keybindings for Goose
  require("which-key").add({
    -- General Goose commands
    { "<leader>g", group = "Goose" },
    { "<leader>gg", function() vim.cmd("Goose") end, mode = {"n", "v"}, desc = "open / close Goose" },
    { "<leader>gq", function() vim.cmd("GooseClose") end, desc = "close Goose" },
    { "<leader>gf", function() vim.cmd("GooseToggleFullscreen") end, desc = "toggle full screen" },

    -- Input and Output
    { "<leader>gi", function() vim.cmd("GooseOpenInput") end, mode = {"n", "v"}, desc = "open input" },
    { "<leader>gI", function() vim.cmd("GooseOpenInputNewSession") end, desc = "open input (new)" },
    { "<leader>go", function() vim.cmd("GooseOpenOutput") end, desc = "open output" },

    -- Session Management
    { "<leader>gs", function() vim.cmd("GooseSelectSession") end, desc = "select and load session" },

    -- Provider and Model Configuration
    { "<leader>gp", function() vim.cmd("GooseConfigureProvider") end, desc = "configure provider & model" },

    -- Diff operations
    { "<leader>gd", function() vim.cmd("GooseDiff") end, desc = "diff" },
    { "<leader>g]", function() vim.cmd("GooseDiffNext") end, desc = "diff next" },
    { "<leader>g[", function() vim.cmd("GooseDiffPrev") end, desc = "diff prev" },
    { "<leader>gc", function() vim.cmd("GooseDiffClose") end, desc = "diff close" },

    -- Revert operations
    { "<leader>gra", function() vim.cmd("GooseRevertAll") end, desc = "revert all" },
    { "<leader>grt", function() vim.cmd("GooseRevertThis") end, desc = "revert this" },

    -- Focus toggle (note: this keybinding is in visual mode)
    { "<leader>gt", function() vim.cmd("GooseToggleFocus") end, mode = {"v"}, desc = "toggle focus" },
  })
end

return M
