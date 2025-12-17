local configs = require "nvim-treesitter.configs"

configs.setup {
  ensure_installed = {
    "bash",
    "cpp",
    "css",
    "csv",
    "desktop",
    "diff",
    "dockerfile",
    "editorconfig",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "graphql",
    "hcl",
    "helm",
    "html",
    "htmldjango",
    "javascript",
    "jq",
    "json",
    "kotlin",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "mermaid",
    "nginx",
    "prisma",
    "proto",
    "python",
    "regex",
    "requirements",
    "robots",
    "rst",
    "rust",
    "sql",
    "ssh_config",
    "terraform",
    "toml",
    "tsv",
    "tsx",
    "vim",
    "xml",
    "yaml",
  },
  -- auto_install = true,
  highlight = {
    enable = true,
  },
  indent = { enable = false },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
}

vim.treesitter.language.register("hcl", "atlas-config")
vim.treesitter.language.register("hcl", "atlas-schema-mysql")
vim.treesitter.language.register("hcl", "atlas-schema-postgresql")
vim.treesitter.language.register("hcl", "atlas-schema-sqlite")
vim.treesitter.language.register("hcl", "atlas-schema-clickhouse")
vim.treesitter.language.register("hcl", "atlas-schema-mssql")
vim.treesitter.language.register("hcl", "atlas-schema-redshift")
vim.treesitter.language.register("hcl", "atlas-test")
vim.treesitter.language.register("hcl", "atlas-plan")
vim.treesitter.language.register("hcl", "atlas-rule")
