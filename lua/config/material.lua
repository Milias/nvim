require("material").setup {
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
  custom_colors = function(colors)
    colors.syntax.comments = "#999999"
  end,
}
