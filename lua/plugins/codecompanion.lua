local M = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "folke/which-key.nvim",
    {
      "echasnovski/mini.diff",
      event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    },
  },
}

function M.config()
  require("codecompanion").setup({
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
    },
    opts = {
      log_level = "DEBUG",
    },
    display = {
      diff = {
        provider = "mini_diff",
      },
      chat = {
        window = {
          -- layout = "float", -- float|vertical|horizontal|buffer
        },
      },
    },
  })
  require("which-key").add({
    { "<leader>c", group = "Code Companion" },
    { "<leader>ca", function() vim.cmd("CodeCompanionActions") end, mode = {"n", "v"}, desc = "Actions" },
    { "<leader>ct", function() vim.cmd("CodeCompanionChat Toggle") end, desc = "Toggle" },
    { "<leader>cc", function() vim.cmd("CodeCompanion") end, desc = "Chat Prompt" },
    { "<leader>cp", function() vim.cmd("CodeCompanionChat Add") end, mode = {"v"}, desc = "Chat Paste" },
    { "<leader>cn", function() vim.cmd("CodeCompanionChat") end, desc = "New Chat" },
  })
end

return M
