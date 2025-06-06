local lspkind = require "lspkind"
local cmp = require "cmp"

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

-- https://github.com/hrsh7th/nvim-cmp/issues/156#issuecomment-916338617
local lspkind_comparator = function(conf)
  local lsp_types = require("cmp.types").lsp
  return function(entry1, entry2)
    if entry1.source.name ~= "nvim_lsp" then
      if entry2.source.name == "nvim_lsp" then
        return false
      else
        return nil
      end
    end
    local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
    local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

    local priority1 = conf.kind_priority[kind1] or 0
    local priority2 = conf.kind_priority[kind2] or 0
    if priority1 == priority2 then
      return nil
    end
    return priority2 < priority1
  end
end

local label_comparator = function(entry1, entry2)
  return entry1.completion_item.label < entry2.completion_item.label
end

local options = {
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },
  -- Installed sources:
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 1, priority = 10 },
    -- display function signatures with current parameter emphasized
    { name = "nvim_lsp_signature_help", priority = 5 },
    {
      name = "buffer",
      keyword_length = 4,
      priority = -10,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    -- { name = "codeium", priority = 5 },
    { name = "snippets" },
    { name = "minuet", priority = 5 },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      item = lspkind.cmp_format {
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
        symbol_map = { Codeium = "" },
      }(entry, item)

      return item
    end,
  },
  completion = {
    -- completeopt = 'menu,menuone,noinsert',
    completeopt = "menu,menuone,noselect",
  },
  experimental = {
    native_menu = false,
    ghost_text = {
      hl_group = "CmpGhostText",
    },
    performance = {
      -- It is recommended to increase the timeout duration due to
      -- the typically slower response speed of LLMs compared to
      -- other completion sources. This is not needed when you only
      -- need manual completion.
      fetching_timeout = 2000,
    },
  },

  enabled = function()
    -- disable completion in comments
    local context = require "cmp.config.context"
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
    end
  end,

  sorting = {
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
    },
  },

  comparators = {
    lspkind_comparator {
      kind_priority = {
        Field = 11,
        Property = 11,
        Constant = 10,
        Enum = 10,
        EnumMember = 10,
        Event = 10,
        Function = 10,
        Method = 10,
        Operator = 10,
        Reference = 10,
        Struct = 10,
        Variable = 9,
        File = 8,
        Folder = 8,
        Class = 5,
        Color = 5,
        Module = 5,
        Keyword = 2,
        Constructor = 1,
        Interface = 1,
        Snippet = 0,
        Text = 1,
        TypeParameter = 1,
        Unit = 1,
        Value = 1,
      },
    },
    label_comparator,
  },
}

cmp.setup(options)
