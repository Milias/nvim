return {
  -- optional for the 'fzf' command
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },

  {
    "linrongbin16/fzfx.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },

    -- specify version to avoid break changes
    -- version = 'v5.*',

    config = function()
      require "config.fzf"
    end,
  },
}
