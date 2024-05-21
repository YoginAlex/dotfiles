local keymap = vim.keymap.set

return {
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = {
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "tsx", "javascript", "typescript" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        -- formatters & linters
        "eslint_d",
        "prettierd",
        "biome",
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    cond = false,
  },
  {
    "pmizio/typescript-tools.nvim",
    ft = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    keys = {
      { "<leader>la", "<cmd>TSToolsOrganizeImports<cr>", desc = "Add Missing Imports" },
      { "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
      { "<leader>lO", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
      { "<leader>lu", "<cmd>TSToolsRemoveUnused<cr>", desc = "Removed Unused" },
      { "<leader>lr", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Removed Unused Imports" },
      { "<leader>ld", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go To Source Definition" },
      { "<leader>lf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
    },
    opts = {
      settings = {
        expose_as_code_action = "all",
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- other settings removed for brevity
    opts = {
      ---@type lspconfig.options
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
          },
        },
      },
      setup = {
        eslint = function()
          local function get_client(buf)
            return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
          end

          local formatter = LazyVim.lsp.formatter({
            name = "eslint: lsp",
            primary = false,
            priority = 200,
            filter = "eslint",
          })

          -- Use EslintFixAll on Neovim < 0.10.0
          if not pcall(require, "vim.lsp._dynamic") then
            formatter.name = "eslint: EslintFixAll"
            formatter.sources = function(buf)
              local client = get_client(buf)
              return client and { "eslint" } or {}
            end
            formatter.format = function(buf)
              local client = get_client(buf)
              if client then
                local diag = vim.diagnostic.get(
                  buf,
                  { namespace = vim.lsp.diagnostic.get_namespace(client.id) }
                )
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end
          end

          -- register the formatter with LazyVim
          LazyVim.format.register(formatter)
        end,
      },
    },
  },
}
