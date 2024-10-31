local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#B35D63" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#C4A76D" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#5590C7" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#AF8456" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#7EA365" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#A665B8" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#4899A3" })
end)

require("ibl").setup { indent = { highlight = highlight } }
