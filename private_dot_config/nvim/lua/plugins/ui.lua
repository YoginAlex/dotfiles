return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 7000,
    },
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true

      local views = opts.views or {}
      table.insert(views, {
        hover = {
          win_options = {
            winhighlight = {
              Normal = "LspSignatureActiveParameter",
              FloatBorder = "LspSignatureActiveParameter",
            },
          },
        },
      })
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {},
  },
}
