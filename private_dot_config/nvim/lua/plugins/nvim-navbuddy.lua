return {
  "SmiteshP/nvim-navbuddy",
  lazy = true,
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    window = {
      size = { height = "80%", width = "80%" },
      sections = {
        mid = {
          size = "20%",
        }
      }
    },
    lsp = {
      auto_attach = true,
    }
  },
  config = function(_, opts)
    require("nvim-navbuddy").setup(opts);
  end,
}
