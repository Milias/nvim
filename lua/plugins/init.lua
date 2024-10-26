return {
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      -- a list of all tools you want to ensure are installed upon
      -- start; they should be the names Mason uses for each tool
      ensure_installed = {
        "codespell",
        "goimports",
        "golines",
        "gopls",
        "htmlbeautifier",
        "luaformatter",
        "prettierd",
        "pydocstyle",
        "ruff",
        "sqlfluff",
        "sqlfmt",
        "stylua",
        "taplo",
        "tflint",
        "yamlfmt",
        "rust_analyzer",
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000, -- ms
      debounce_hours = 4, -- hours
    },
  },

  { "cappyzawa/trim.nvim", event = "BufWritePre" },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "venv",
          ".venv",
          "target",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "rust", "toml", "python", "yaml", "json", "markdown_inline", "vim" },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ident = { enable = true },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
    },
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup {
        -- max_line_len = 101,
        -- gofmt = "",
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^5",
  --   ft = { "rust" },
  -- },

  { "echasnovski/mini.nvim", version = false },
  { "nvim-tree/nvim-web-devicons" },

  {
    "sindrets/diffview.nvim",
    lazy = false,
    ops = {
      enhanced_diff_hl = true,
      default_args = {
        DiffviewOpen = { "-uno" },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
  },

  {
    "marko-cerovac/material.nvim",
    opts = {
      styles = { -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = { --[[ bold = true ]]
        },
        keywords = { --[[ underline = true ]]
        },
        functions = { --[[ bold = true, undercurl = true ]]
        },
        variables = {},
        operators = {},
        types = {},
      },

      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "coc",
        -- "colorful-winsep",
        -- "dap",
        -- "dashboard",
        -- "eyeliner",
        -- "fidget",
        -- "flash",
        -- "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        -- "indent-blankline",
        -- "lspsaga",
        "mini",
        -- "neogit",
        -- "neotest",
        "neo-tree",
        -- "neorg",
        -- "noice",
        "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        "telescope",
        -- "trouble",
        "which-key",
        -- "nvim-notify",
      },
      disable = {
        -- Disable borders between vertically split windows
        borders = false,
        -- Prevent the theme from setting the background.
        background = true,
        -- Prevent the theme from setting terminal colors
        term_colors = false,
      },
      lualine_style = "stealth",
    },
  },
}
