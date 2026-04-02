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
}

-- Fix nvim-treesitter query directives for Neovim 0.12+ (TSNode[] match format)
if vim.fn.has("nvim-0.12") == 1 then
  local query = require("vim.treesitter.query")

  local function resolve_node(match, capture_id)
    local val = match[capture_id]
    if type(val) == "table" then
      return val[1]
    end
    return val
  end

  query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
    local node = resolve_node(match, pred[2])
    if not node then
      return
    end
    local text = vim.treesitter.get_node_text(node, bufnr):lower()
    local lang = vim.filetype.match({ filename = "a." .. text }) or text
    metadata["injection.language"] = lang
  end, { force = true, all = false })

  query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
    local node = resolve_node(match, pred[2])
    if not node then
      return
    end
    local type_attr = vim.treesitter.get_node_text(node, bufnr)
    local parts = vim.split(type_attr, "/", {})
    metadata["injection.language"] = parts[#parts]
  end, { force = true, all = false })

  query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
    local node = resolve_node(match, pred[2])
    if not node then
      return
    end
    local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[pred[2]] }) or ""
    if not metadata[pred[2]] then
      metadata[pred[2]] = {}
    end
    metadata[pred[2]].text = string.lower(text)
  end, { force = true, all = false })
end

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
