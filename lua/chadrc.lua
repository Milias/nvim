-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

vim.cmd "highlight St_relativepath guifg=#999999 guibg=#2a2b36"
vim.cmd "highlight St_mixedindent guifg=#cc8833 guibg=#2a2b36"

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.base46 = {
  hl_override = {
    Comment = { italic = false, fg = "#999999" },
    ["@comment"] = { italic = false, fg = "#999999" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "arrow",
    order = {
      "mode",
      "relativepath",
      "file",
      "mixed_indent",
      "git",
      "diagnostics",
      "%=",
      "lsp_msg",
      "%=",
      "lsp",
      "cwd",
      "cursor",
    },
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_relativepath#  " .. vim.fn.expand "%:.:h" .. " /"
      end,
      mixed_indent = function()
        local space_pat = [[\v^ +]]
        local tab_pat = [[\v^\t+]]
        local space_indent = vim.fn.search(space_pat, "nwc")
        local tab_indent = vim.fn.search(tab_pat, "nwc")
        local mixed = (space_indent > 0 and tab_indent > 0)
        local mixed_same_line
        if not mixed then
          mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
          mixed = mixed_same_line > 0
        end
        if not mixed then
          return ""
        end
        if mixed_same_line ~= nil and mixed_same_line > 0 then
          return "%#St_mixedindent#" .. " MixedIndent: " .. mixed_same_line
        end
        local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
        local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
        if space_indent_cnt > tab_indent_cnt then
          return "%#St_mixedindent#" .. " MixedIndent: " .. tab_indent .. " "
        else
          return "%#St_mixedindent#" .. " MixedIndent: " .. space_indent .. " "
        end
      end,
    },
  },
}

return M
