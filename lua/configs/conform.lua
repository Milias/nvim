local options = {
  formatters_by_ft = {
    proto = { "buf" },
    json = { "jq" },
    jsonc = { "jq" },
    terraform = { "terraform_fmt" },
    yaml = { "yamlfmt" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    html = { "djlint" },
    toml = { "taplo" },
    go = { "golines", "goimports" },
    python = { "ruff_format", "ruff_fix" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    xml = { "xmlformat" },
    scss = { "prettierd" },
    hcl = { "packer_fmt" },
    cpp = { "clang-format" },
    sql = { "sqlfluff" },
    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace", "trim_newlines" },
  },

  -- Conform will notify you when a formatter errors
  notify_on_error = true,
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf, lsp_fallback = true, timeout = 15000 }
  end,
})

return options
