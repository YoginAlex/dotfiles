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
