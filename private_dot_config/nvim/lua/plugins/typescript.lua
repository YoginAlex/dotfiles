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
    config = function(opts)
      require("lazyvim.util.lsp").on_attach(function(client, bufnr)
        if client.name == "typescript-tools" then
          keymap(
            "n",
            "<leader>la",
            "<cmd>TSToolsAddMissingImports<cr>",
            { buffer = bufnr, desc = "Add Missing Imports" }
          )
          keymap(
            "n",
            "<leader>lo",
            "<cmd>TSToolsOrganizeImports<cr>",
            { buffer = bufnr, desc = "Organize Imports" }
          )
          keymap(
            "n",
            "<leader>lO",
            "<cmd>TSToolsSortImports<cr>",
            { buffer = bufnr, desc = "Sort Imports" }
          )
          keymap(
            "n",
            "<leader>lu",
            "<cmd>TSToolsRemoveUnused<cr>",
            { buffer = bufnr, desc = "Removed Unused" }
          )
          keymap(
            "n",
            "<leader>lr",
            "<cmd>TSToolsRemoveUnusedImports<cr>",
            { buffer = bufnr, desc = "Removed Unused Imports" }
          )
          keymap(
            "n",
            "<leader>ld",
            "<cmd>TSToolsGoToSourceDefinition<cr>",
            { buffer = bufnr, desc = "Go To Source Definition" }
          )
          keymap("n", "<leader>lf", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
          require("twoslash-queries").attach(client, bufnr)
        end
      end)
      require("typescript-tools").setup(opts)
    end,
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
