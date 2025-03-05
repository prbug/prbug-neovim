local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
}

function M.config()
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
end

return M

-- -- setup for copilot.vim
-- local M = {
--   "github/copilot.vim",
--   cmd = "Copilot",
--   event = "InsertEnter",
-- }
--
-- function M.config()
--   gh_enterprise_url = os.getenv "GH_ENTERPRISE_URL"
--   if gh_enterprise_url then
--     vim.g.copilot_auth_provider_url = gh_enterprise_url
--   end
--   vim.g.copilot_no_tab_map = true
--   vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- end
--
-- return M
