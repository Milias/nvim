require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set("n", "<F1>", "<Cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<F2>", "<Cmd>DiffviewOpen<CR>")
vim.keymap.set("i", "<F1>", "<Esc>")

local telescope_builtin = require "telescope.builtin"
vim.keymap.set("n", "<Leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<Leader>fs", telescope_builtin.grep_string, {})
vim.keymap.set("n", "<Leader>ft", telescope_builtin.treesitter, {})
vim.keymap.set("n", "<Leader>fds", telescope_builtin.lsp_document_symbols, {})

-- Code navigation shortcuts
vim.keymap.set("n", "gD", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gR", vim.lsp.buf.rename)
vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "gd", vim.lsp.buf.declaration)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("n", "g[", function()
  vim.diagnostic.jump { count = -1, float = true }
end)
vim.keymap.set("n", "g]", function()
  vim.diagnostic.jump { count = 1, float = true }
end)
vim.keymap.set("n", "gL", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end)
vim.keymap.set("n", "gS", function()
  vim.cmd [[ SymbolsOutline ]]
end)

vim.keymap.set("n", "<Leader>s", function()
  vim.cmd [[ set invspell ]]
end)

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
