vim.keymap.set("n", "<F1>", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<F2>", "<Cmd>DiffviewOpen<CR>")
vim.keymap.set("i", "<F1>", "<Esc>")

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
}
