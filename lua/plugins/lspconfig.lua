local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
}

function M.config()
  local lspconfig = require("lspconfig")
  -- ########## harper ##########
  -- lspconfig.harper_ls.setup({})

  -- ########## lua ##########
  -- lua language server
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })
  require("neodev").setup({})

  -- ########## python ##########
  lspconfig.ty.setup({})
  -- lspconfig.pyright.setup({
  --   root_dir = function(fname)
  --     -- Look for pyproject.toml first as the root directory marker
  --     return lspconfig.util.root_pattern("pyproject.toml")(fname)
  --       or lspconfig.util.root_pattern("setup.py", "setup.cfg", "requirements.txt")(fname)
  --       or lspconfig.util.find_git_ancestor(fname)
  --   end,
  --   settings = {
  --     python = {
  --       analysis = {
  --         -- Enable type checking
  --         typeCheckingMode = "basic", -- Changed from false to "basic" for type checking
  --         -- Use pyproject.toml for configuration
  --         extraPaths = { "." },
  --       },
  --     },
  --   },
  -- })
  -- Ruff
  lspconfig.ruff.setup({})
  lspconfig.taplo.setup({})

  -- ########## javascript ##########
  -- TypeScript Server
  lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
      -- Enable formatting if desired
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  })

  -- ########## golang ##########
  -- Golang
  lspconfig.gopls.setup({})
  -- lspconfig.gopls.setup({
  --   cmd = { "gopls", "serve" },
  --   on_attach = function(client, bufnr)
  --     client.resolved_capabilities.document_formatting = false
  --   end,
  -- })

  -- ########## rust ##########
  -- rust-analyzer
  -- lspconfig.rust_analyzer.setup({}) -- handled by rustaceanvim
end

return M
