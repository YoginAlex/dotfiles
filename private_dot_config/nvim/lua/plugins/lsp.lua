return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      -- codelens = { enabled = true, },
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
        -- "typescript-language-server",
        "css-lsp",
        "chrome-debug-adapter",
      },
      ui = {
        border = "rounded",
      },
    },
  },
}
