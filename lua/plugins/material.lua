return {
  { "nvim-tree/nvim-web-devicons" },
  { "echasnovski/mini.nvim", version = false },
  {
    "marko-cerovac/material.nvim",
    config = function()
      require "config.material"
    end,
  },
}
