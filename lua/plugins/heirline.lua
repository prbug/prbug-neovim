-- return {}
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
      DiagnosticError = "",
      DiagnosticHint = "",
      DiagnosticInfo = "󰋽",
      DiagnosticWarn = "",
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

  -- mode provider
  local ViMode = {
    init = function(self)
      self.mode = vim.fn.mode(1)
    end,
    static = {
      mode_names = {
        n = "NORMAL",
        no = "OP",
        nov = "OP",
        noV = "OP",
        ["no\22"] = "OP",
        niI = "NORMAL",
        niR = "NORMAL",
        niV = "NORMAL",
        nt = "TERMINAL",
        v = "VISUAL",
        vs = "VISUAL",
        V = "V-LINE",
        Vs = "V-LINE",
        ["\22"] = "V-BLOCK",
        ["\22s"] = "V-SELECT",
        s = "V-SELECT",
        S = "V-SELECT",
        ["\19"] = "V-BLOCK",
        i = "INSERT",
        ic = "INSERT",
        ix = "INSERT",
        R = "REPLACE",
        Rc = "REPLACE",
        Rx = "REPLACE",
        Rv = "V-REPLACE",
        Rvc = "V-REPLACE",
        Rvx = "V-REPLACE",
        c = "COMMAND",
        cv = "COMMAND",
        r = "PROMPT",
        rm = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        t = "TERMINAL",
      },
      mode_colors = {
        n = "#ffc9c9",
        i = "#afc3ac",
        v = "#8dd1da",
        V = "#8dd1da",
        ["\22"] = "#8dd1da",
        c = "orange",
        s = "purple",
        S = "purple",
        ["\19"] = "purple",
        R = "orange",
        r = "orange",
        ["!"] = "red",
        t = "red",
      },
    },
    provider = function(self)
      -- return " " .. self.mode_names[self.mode] .. ""
      return self.mode_names[self.mode]
    end,
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      return { fg = self.mode_colors[mode], bg = "NONE", bold = true }
    end,
    update = {
      "ModeChanged",
      pattern = "*:*",
      callback = vim.schedule_wrap(function()
        vim.cmd("redrawstatus")
      end),
    },
  }

  -- Setup
  heirline_components.init.subscribe_to_events()
  local heirline_colors = heirline_components.hl.get_colors()
  heirline.load_colors(heirline_colors)
  local space = { provider = "   ", hl = { bg = "NONE" } }
  local padding = { provider = " ", hl = { bg = "NONE" } }
  heirline.setup({
    statusline = {
      padding,
      ViMode,
      space,
      -- For each component from lib, add an override for transparent background
      lib.git_branch(),
      lib.git_diff({ hl = { bg = "NONE" } }),
      lib.virtual_env({ hl = { bg = "NONE" } }),
      lib.fill({ hl = { bg = "NONE" } }),
      lib.cmd_info({ hl = { bg = "NONE" } }),
      lib.fill({ hl = { bg = "NONE" } }),
      lib.diagnostics({ hl = { bg = "NONE" } }),
      -- lib.lsp({ hl = { fg = "#ffbe69", bg = "NONE" } }),
      space,
      lib.file_info({ hl = { fg = "#a0d0c0", bg = "NONE" } }),
      lib.nav({ scrollbar = false, hl = { fg = "teal", bg = "NONE" } }),
      padding,
    },
  })
end

return M
