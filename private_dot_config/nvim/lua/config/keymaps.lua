-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
--
-- Delete LazyVim default bindings which are nuisance for me
local keymaps_to_delete = {
  { "n", "<leader>l" },
  { "n", "<leader>L" },
  { "n", "<leader>-" },
  { "n", "<leader>|" },
  { "n", "<leader>fT" },
  { "n", "<leader>ft" },
  { "n", "<leader>cm" },
}

for _, value in pairs(keymaps_to_delete) do
  keymap.del(value[1], value[2])
end

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
  local buf_modifiable =
    vim.api.nvim_get_option_value("modifiable", { buf = vim.api.nvim_get_current_buf() })
  if buf_modifiable then
    return "ciw"
  else
    return "<CR>"
  end
end, { expr = true })

-- Add LazyVim bindings for meta information
keymap.set("n", "<leader>;m", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
keymap.set("n", "<leader>;p", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
keymap.set("n", "<leader>;e", "<cmd>LazyExtras<CR>", { desc = "Extras Manager - [LazyVim]" })
keymap.set("n", "<leader>;l", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
keymap.set("n", "<leader>;i", "<cmd>ConformInfo<CR>", { desc = "Conform Info" })
keymap.set("n", "<leader>;c", LazyVim.news.changelog, { desc = "Changelog [LazyVim]" })
keymap.set("n", "<leader>;M", vim.cmd.messages, { desc = "Display Messages" })
