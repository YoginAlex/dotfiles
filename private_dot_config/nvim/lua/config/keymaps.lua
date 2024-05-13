-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- copy to system clipboard
keymap.set(
  { "n", "v" },
  "<leader>y",
  '"+y',
  { noremap = true, silent = true, desc = "Copy to clipboard" }
)
-- jj to exit insert mode
keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p', { desc = "Paste from 0 register" })
keymap.set("n", "<Leader>P", '"0P', { desc = "Paste from 0 register above" })

-- Resize window using alt/option arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Enter change inner word if the buffer is modifiable, otherwise just press enter
keymap.set("n", "<CR>", function()
  local buf_modifiable = vim.api.nvim_buf_get_option(0, "modifiable")
  if buf_modifiable then
    return "ciw"
  else
    return "<CR>"
  end
end, { expr = true })

-- Change colorscheme
local colorschemes = {
  "catppuccin-frappe",
  "kanagawa-wave",
  "tokyonight-moon",
  "kanagawa-dragon",
  "catppuccin-latte",
}
local current_colorscheme = 1
vim.api.nvim_create_user_command("ChangeColorscheme", function()
  current_colorscheme = current_colorscheme + 1
  if current_colorscheme > #colorschemes then
    current_colorscheme = 1
  end
  print("Changing colorscheme to " .. colorschemes[current_colorscheme])
  vim.cmd("colorscheme " .. colorschemes[current_colorscheme])
end, { desc = "Change Colorscheme" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>uu",
  ":ChangeColorscheme<CR>",
  { noremap = true, silent = true }
)
