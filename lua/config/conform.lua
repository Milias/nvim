local options = {
  formatters_by_ft = {
    cpp = { "clang-format" },
    go = { "golines", "goimports" },
    graphql = { "biome" },
    hcl = { "packer_fmt" },
    html = { "djlint" },
    javascript = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    lua = { "stylua" },
    proto = { "buf" },
    python = { "ruff_format", "ruff_fix" },
    rust = { "rustfmt" },
    scss = { "biome" },
    sql = { "sqlfluff" },
    terraform = { "terraform_fmt" },
    toml = { "taplo" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    xml = { "xmlformat" },
    yaml = { "yamlfmt" },
    -- Use the "*" filetype to run formatters on all filetypes.
    -- ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace", "trim_newlines" },
  },

  -- Conform will notify you when a formatter errors
  notify_on_error = true,

  -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#autoformat-with-extra-features
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    -- Disable autoformat for files in a certain path
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match "/node_modules/" then
      return
    end

    return { timeout_ms = 500, lsp_format = "fallback" }
  end,

  format_after_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return { lsp_format = "fallback" }
  end,
}

require("conform").setup(options)

-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format { async = true, lsp_format = "fallback", range = range }
end, { range = true })

-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
