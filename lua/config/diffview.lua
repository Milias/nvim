require("diffview").setup {
  enhanced_diff_hl = true,
  default_args = {
    DiffviewOpen = { "-uno" },
  },
}

vim.schedule(function()
  vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#431313" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none", fg = "#431313" })
  vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = "none", fg = "#431313" })
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#142a03" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3B3307" })
  vim.api.nvim_set_hl(0, "DiffText", { bg = "#4D520D" })
end)
