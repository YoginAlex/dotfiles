-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local set_hl_for_floating_window = function()
  vim.api.nvim_set_hl(0, "NormalFloat", {
    link = "Normal",
  })
  vim.api.nvim_set_hl(0, "FloatBorder", {
    bg = "none",
  })
end

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  desc = "Avoid overwritten by loading color schemes later",
  callback = set_hl_for_floating_window,
})
