local M = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
}

function M.config()
  local configs = require("nvim-treesitter.configs")
  configs.setup({
    ensure_installed = "all",
    auto_install = true,
    ignore_install = {
      "astro",
      "vue",
      "nickel",
      "beancount",
      "liquidsoap",
      "ruby",
      "nord",
      "d",
      "perl",
      "tlaplus",
      "wing",
      "norg",
    },
    sync_install = false,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
  })
end

return M
