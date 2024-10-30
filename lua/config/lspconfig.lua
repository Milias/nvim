local lspconfig = require "lspconfig"

local servers = {
  "bashls",
  "cssls",
  "html",
  "jsonls",
  "ltex",
  "lua_ls",
  "prismals",
  "ruff_lsp",
  "tailwindcss",
  "terraformls",
  "vtsls",
  "yamlls",
}
local configs = require "lspconfig.configs"
local util = require "lspconfig.util"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end

lspconfig.basedpyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
      },
    },
  },
}

if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return util.root_pattern "Chart.yaml"(fname)
      end,
    },
  }
end

lspconfig.helm_ls.setup {
  filetypes = { "helm" },
  cmd = { "helm_ls", "serve" },
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {},
  },
}

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
      cargo = {
        allFeatures = true,
      },
    },
  },
}

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
