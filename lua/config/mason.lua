local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local mason_tool_installer = require "mason-tool-installer"

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

mason_lspconfig.setup {
  lazy = true,
  automatic_installation = true,
  ensure_installed = {
    "basedpyright",
    "bashls",
    "buf_ls",
    "helm_ls",
    "html",
    "jsonls",
    "ltex",
    "lua_ls",
    -- "mdx_analyzer",
    "prismals",
    "ruff",
    "terraformls",
    "vtsls",
    "yamlls",
  },
}

mason_tool_installer.setup {
  lazy = true,
  ensure_installed = {
    "biome",
    "codespell",
    "goimports",
    "golines",
    "gopls",
    "hclfmt",
    "htmlbeautifier",
    "luaformatter",
    "prettierd",
    "pydocstyle",
    "ruff",
    "rust_analyzer",
    "shfmt",
    "sqlfluff",
    "sqlfmt",
    "stylua",
    "taplo",
    "tflint",
    "yamlfmt",
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 3000, -- ms
  debounce_hours = 4, -- hours
}
