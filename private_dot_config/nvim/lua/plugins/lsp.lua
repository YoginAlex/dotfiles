local M = {}

M.servers = { "clangd", "lua_ls", "stylelint_lsp", "html", "cssls", "eslint", "tsserver", "jsonls", "cssmodules_ls" }

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  require("lsp-format").on_attach(client)

  nmap("fr", require("telescope.builtin").lsp_references)
  nmap("<leader>fg", "<cmd>:Navbuddy<CR>")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function() vim.lsp.buf.format({ timeout_ms = 2000 }) end,
    { desc = "Format current buffer with LSP" })
end

vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.config({
      virtual_text = false,
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
    end
  else
    vim.g.diagnostics_active = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.diagnostic.config({
        virtual_text = true,
      })
    )
  end
end

vim.keymap.set({ "n", "v" }, "<leader>tt", ":lua toggle_diagnostics()<CR>", { silent = true })

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "lukas-reineke/lsp-format.nvim" },
    { "williamboman/mason.nvim",          build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
      opts = { lsp = { auto_attach = true } }
    }
  },
  opts = {
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    },
    -- Automatically format on save
    autoformat = true,
  },
  config = function()
    require("mason").setup {
      ui = {
        icons = {
          package_installed = "✓"
        }
      }
    }

    require("mason-lspconfig").setup {
      ensure_installed = M.servers,
      automatic_installation = true,
    }

    for _, lsp in ipairs(M.servers) do
      require("lspconfig")[lsp].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
      }
    end
  end
}
