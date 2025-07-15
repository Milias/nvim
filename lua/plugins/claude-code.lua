return {
  "greggh/claude-code.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require "config.claude-code"
  end,
}
