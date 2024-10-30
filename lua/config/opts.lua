-- menuone: popup even when there is only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menu", "menuone", "noselect" } --, "noinsert"}
vim.opt.shortmess = vim.opt.shortmess + { c = true }

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd [[
set signcolumn=yes
syntax enable
filetype plugin indent on
]]

-- Options
vim.opt.number = true
vim.opt.hidden = true
vim.opt.mousemodel = "extend"
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.autowrite = true
vim.opt.showmode = false
vim.opt.gdefault = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.clipboard = "unnamedplus"
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "·", extends = ">", precedes = "<" }
vim.opt.cmdheight = 2

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.termguicolors = true
vim.cmd.colorscheme "material"
vim.g.background = "dark"
vim.g.material_style = "oceanic"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
