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

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
  },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "wave",
      colors = {
        palette = {},
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    opts = {
      flavour = "frappe",
    },
    name = "catppuccin",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
