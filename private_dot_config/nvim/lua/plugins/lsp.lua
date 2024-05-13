return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = { border = "rounded" },
      },
      setup = {
        stylelint_lsp = function(_, opts)
          opts.filetypes = { "css", "scss", "less", "sass" }
        end,
        solargraph = function(_, opts)
          require("lspconfig").solargraph.setup({
            settings = {
              solargraph = {
                autoformat = false,
                formatting = false,
                completion = true,
                diagnostic = true,
                folding = true,
                references = true,
                rename = true,
                symbols = true,
              },
            },
          })
          return true
        end,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "typescript-language-server",
        "css-lsp",
      },
      ui = {
        border = "rounded",
      },
    },
  },
}
