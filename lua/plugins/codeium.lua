return {
  "Exafunction/codeium.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require "config.codeium"
  end,
}
