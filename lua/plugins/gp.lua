local M = {
  "Robitx/gp.nvim",
}

function M.config()
  require("gp").setup({
    providers = {
      openai = { disable = true },
      copilot = {
        disable = false,
        endpoint = "https://api.githubcopilot.com/chat/completions",
        secret = {
          "bash",
          "-c",
          "cat ~/.config/github-copilot/apps.json | jq -r '.[\"github.com:Iv1.b507a08c87ecfe98\"].oauth_token'",
        },
      },
    },
    agents = {
      {
        provider = "copilot",
        name = "ChatCopilot",
        chat = true,
        command = false,
        -- string with model name or table with model name and parameters
        model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
        -- system prompt (use this to specify the persona/role of the AI)
        system_prompt = require("gp.defaults").chat_system_prompt,
      },
      {
        provider = "copilot",
        name = "CodeCopilot",
        chat = false,
        command = true,
        -- string with model name or table with model name and parameters
        model = { model = "gpt-4o", temperature = 0.8, top_p = 1, n = 1 },
        -- system prompt (use this to specify the persona/role of the AI)
        system_prompt = require("gp.defaults").code_system_prompt,
      },
    },
  })
end

return M
