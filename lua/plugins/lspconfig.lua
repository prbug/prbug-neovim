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

  -- ########## lua ##########
  -- lua language server
  lspconfig.lua_ls.setup({
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
        then
          return
        end
      end
      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = { version = "LuaJIT" },
        -- Make the server aware of Neovim runtime files
        workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
        -- format = { enable = true, defaultConfig = { indent_style = "space", indent_size = "2" } },
      })
    end,
    settings = {
      Lua = {
        format = {
          enable = false,
        },
        diagnostics = {
          globals = { "vim", "spec" },
        },
        runtime = {
          version = "LuaJIT",
          special = {
            spec = "require",
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
    require("neodev").setup({}),
  })

  -- ########## python ##########
  -- pyright
  lspconfig.pyright.setup({})

  -- ########## javascript ##########
  -- typescript server
  lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  })

  -- ########## golang ##########
  -- gopls
  lspconfig.gopls.setup({
    cmd = { "gopls", "serve" },
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  })

  -- ########## rust ##########
  -- rust-analyzer
  -- lspconfig.rust_analyzer.setup({})
end

return M
