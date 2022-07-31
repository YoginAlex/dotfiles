require('packer_init')
require('core')
require('keymaps')

require('plugins.colorized')
require('plugins.better-escape')
require('plugins.which-key')
require('plugins.lualine')
require('plugins.comment')
require('plugins.indent-blankline')

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    height = 0.65,
    case_mode = "ignore_case"
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.3,
        results_width = 0.8,
      },
      vertical = {
        prompt_position = "bottom",
        mirror = false,
      },
      width = 0.95,
      height = 0.90,
      -- preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
  },
  pickers = {
    find_files = {
      layout_strategy = "vertical",
    },
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
  },
  extensions = {
    file_browser = {
      -- previewer = false,
      -- theme = "dropdown",
      layout_strategy = "vertical",
      path = "%:p:h",
    }
  }
})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
vim.keymap.set("n", "<leader>su", require('telescope').extensions.file_browser.file_browser,
  { desc = '[S]earch c[u]rrent', noremap = true })

require('orgmode').setup_ts_grammar()

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'typescript', 'python', 'ruby', 'tsx', 'javascript' },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'org' }
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

local saga = require("lspsaga")

saga.init_lsp_saga({
  -- your configuration
})
local action = require("lspsaga.codeaction")

vim.keymap.set("n", "gh", require("lspsaga.finder").lsp_finder, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ca", action.code_action, { silent = true, noremap = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  action.range_code_action()
end, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gr", require("lspsaga.rename").lsp_rename, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gd", require("lspsaga.definition").preview_definition, { silent = true, noremap = true })
vim.keymap.set("n", "[d", require("lspsaga.diagnostic").goto_prev, { silent = true, noremap = true })
vim.keymap.set("n", "]d", require("lspsaga.diagnostic").goto_next, { silent = true, noremap = true })
-- scroll down hover doc or scroll in definition preview
-- vim.keymap.set("n", "<C-f>", function()
--   action.smart_scroll_with_saga(1)
-- end, { silent = true })
-- -- scroll up hover doc
-- vim.keymap.set("n", "<C-b>", function()
--   action.smart_scroll_with_saga(-1)
-- end, { silent = true })
-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Diagnostic open float" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
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

  -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- scroll down hover doc or scroll in definition preview
  -- nmap("<C-d>", function() require("lspsaga.codeaction").smart_scroll_with_saga(1) end, '')
  -- scroll up hover doc
  -- nmap("<C-u>", function() require("lspsaga.codeaction").smart_scroll_with_saga(0) end, '')

  -- See `:help K` for why this keymap
  nmap("K", require("lspsaga.hover").render_hover_doc, 'Hover Documentation')

  -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', require("lspsaga.signaturehelp").signature_help, 'Signature Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function() vim.lsp.buf.format({ timeout_ms = 2000 }) end,
    { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'sumneko_lua', 'stylelint_lsp', 'html', 'cssls',
  'eslint', 'tsserver', 'jsonls' }

-- Ensure the servers above are installed
require('nvim-lsp-installer').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false, },
    },
  },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'orgmode' },
  },
}

require("nvim-autopairs").setup()
local null_ls = require("null-ls")

null_ls.setup({
  -- debug = true,
  -- save_after_format = true,
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.formatting.stylelint,
    null_ls.builtins.diagnostics.eslint_d
  }
})

vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.config({
      virtual_text = false,
      -- underline = false
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  else
    vim.g.diagnostics_active = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.diagnostic.config({
        virtual_text = true,
        -- underline = true
      })
    )
  end
end

vim.keymap.set({ 'n', 'v' }, '<leader>tt', ':lua toggle_diagnostics()<CR>', { silent = true })

require('nvim-web-devicons').setup()
require('neoclip').setup()
require('orgmode').setup({
  org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
