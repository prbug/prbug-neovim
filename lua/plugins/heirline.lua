local M = {
  "rebelot/heirline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "Zeioth/heirline-components.nvim",
  },
}

function M.config()
  local heirline = require("heirline")
  require("heirline-components").setup({
    icons = {
      TabClose = "󰅙",
      BufferClose = "󰅖",
      ArrowLeft = "",
      ArrowRight = "",
      FileModified = "",
      FileReadOnly = "",

      -- Heirline-components - winbar
      CompilerPlay = "",
      CompilerStop = "",
      CompilerRedo = "",
      NeoTree = "",
      Aerial = "",
      ZenMode = "󰰶",
      BufWrite = "",
      BufWriteAll = "",
      Ellipsis = "…",
      BreadcrumbSeparator = "",

      -- Heirline-components - statuscolumn
      FoldClosed = "",
      FoldOpened = "",
      FoldSeparator = " ",

      -- Heirline-components - statusline components
      ActiveLSP = "",
      ActiveTS = "",
      Environment = "",
      DiagnosticError = "",
      DiagnosticHint = "󰌵",
      DiagnosticInfo = "󰋼",
      DiagnosticWarn = "",
      LSPLoading1 = "",
      LSPLoading2 = "󰀚",
      LSPLoading3 = "",
      SearchCount = "",
      MacroRecording = "",
      ToggleResults = "󰑮",

      -- Heirline-components - misc
      Paste = "󰅌",
      PathSeparator = "",

      -- Git
      GitBranch = "",
      GitAdd = "",
      GitChange = "",
      GitDelete = "",
    },
  })
  local heirline_components = require("heirline-components.all")
  local lib = heirline_components.component

  -- Setup
  heirline_components.init.subscribe_to_events()
  heirline.load_colors(heirline_components.hl.get_colors())
  heirline.setup({
    statusline = {
      lib.mode({ mode_text = {} }),
      lib.git_branch(),
      lib.git_diff(),
      lib.virtual_env(),
      lib.fill(),
      lib.cmd_info(),
      lib.fill(),
      lib.diagnostics(),
      lib.lsp({ hl = { fg = "#ffffff" } }),
      lib.file_info(),
      lib.nav({ scrollbar = false }),
    },
  })
end

return M
