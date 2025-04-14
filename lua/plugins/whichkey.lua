local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local Snacks = require("snacks")
  local wk = require("which-key")
  wk.setup({
    -- appearance
    win = { border = "rounded" },
    preset = "helix",
  })
  wk.add({
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers", },
    { "<leader>/", function() vim.cmd("normal gcc") end, desc = "Comment", mode = { "n" }, },
    { "<leader>/", function() vim.cmd("normal gc") end, desc = "Comment", mode = { "v" }, },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History", },
    -- { "<leader>e", function() vim.cmd("Neotree toggle left reveal_force_cwd") end, desc = "File Explorer", },
    { "<leader>e", function() Snacks.explorer.open() end, desc = "File Explorer", },
    -- { "<leader>e", function() Snacks.explorer.reveal() end, desc = "File Explorer", },
    { "<leader>r", function() vim.lsp.buf.rename() end, desc = "Rename Variable" },
    { "<leader>R", function() Snacks.rename.rename_file() end, desc = "Rename File", },
    { "<leader>t", function() vim.cmd("Themery") end, desc = "Themes" },
    { "<leader>L", function() vim.cmd("Lazy") end, desc = "Lazy" },
    -- avante
    { "<leader>a", group = "Avante", },
    -- find
    { "<leader>f", group = "find" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files", },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects", },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent", },
    { "<leader>ft", function() Snacks.picker.grep() end, desc = "Find Text", },
    -- git
    { "<leader>g", group = "git" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches", },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line", },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status", },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash", },
    { "<leader>gd", function() vim.cmd("DiffviewOpen") end, desc = "Git Diff", },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File", },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" }, },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
    -- search
    { "<leader>s", group = "search" },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep", },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" }, },
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers", },
    { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History", },
    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds", },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History", },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands", },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages", },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights", },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons", },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps", },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List", },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks", },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages", },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec", },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List", },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume", },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
    -- LSP
    { "<leader>l", group = "LSP" },
    { "<leader>la", function() vim.lsp.buf.code_action() end, desc = "Code Action", },
    { "<leader>ld", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
    { "<leader>lD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics", },
    { "<leader>lf", function() vim.lsp.buf.format({ timeout_ms = 1000000 }) end, desc = "Format", },
    { "<leader>li", function() vim.cmd("LspInfo") end, desc = "LSP Info", },
    { "<leader>lI", function() vim.cmd("Mason") end, desc = "Mason Info", },
    { "<leader>lj", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic", },
    { "<leader>lk", function() vim.diagnostic.goto_prev() end, desc = "Prev Diagnostic", },
    { "<leader>lh", function() vim.diagnostic.open_float() end, desc = "Hover Diagnostic", },
    -- go to
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration", },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References", },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation", },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols", },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },

    -- Other
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
    { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
    { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
    { "<leader>n",  function() vim.cmd.nohlsearch() end, desc = "No Highlight" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
    { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", },
    { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore", },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" }, },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" }, },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          border = "rounded",
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
    -- UI group definition
    { "<leader>u", group = "UI" },
    { "<leader>i", group = "info" },
    { "<leader>in", function() require("fidget").notification.show_history() end, desc = "Notification History", },
    -- { "<leader>in", function() Snacks.notifier.show_history() end, desc = "Notification History", },
  })
end

return M
