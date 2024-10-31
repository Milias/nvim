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
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#8B4A4E" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#9E8759" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#456F99" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#8B6B45" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#657F50" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#825091" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#3A7A82" })
end)

require("ibl").setup { indent = { highlight = highlight } }
