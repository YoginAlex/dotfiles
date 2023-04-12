return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    signs = {
      add = { text = "+"},
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    current_line_blame = true,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
