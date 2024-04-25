return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 7000,
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      views = {
        hover = {
          win_options = {
            winhighlight = {
              Normal = "LspSignatureActiveParameter",
              FloatBorder = "LspSignatureActiveParameter",
            },
          },
        },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {},
  },
}
