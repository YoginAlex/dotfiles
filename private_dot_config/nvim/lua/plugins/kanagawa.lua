return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "wave",
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
  end,
  init = function()
    vim.cmd("colorscheme kanagawa")
  end,
}
