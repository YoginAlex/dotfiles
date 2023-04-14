return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" }
  },
  opts = {
    lightbulb = {
      enabled = false,
      sign = false,
      sign_priority = 20,
      virtual_text = true,
    },
    code_action = {
      show_server_name = true,
    },
    diagnostic = {
      on_insert = true,
      on_insert_follow = false,
      insert_winblend = 0,
      show_code_action = false,
      show_source = true,
      jump_num_shortcut = true,
      max_width = 0.7,
      max_height = 0.6,
      max_show_width = 0.7,
      max_show_height = 0.6,
      text_hl_follow = true,
      border_follow = true,
      extend_relatedInformation = false,
      keys = {
        exec_action = 'o',
        quit = 'q',
        go_action = 'g',
        expand_or_jump = '<CR>',
        quit_in_show = { 'q', '<ESC>' },
      },
    },
  },
  keys = {
    -- Lsp finder find the symbol definition implement reference
    -- when you use action in finder like open vsplit then you can
    -- use <C-t> to jump back
    { "gh",         "<cmd>Lspsaga lsp_finder<CR>" },
    -- Code action
    { "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
    { "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", mode = { "v" } },
    -- Rename
    { "gr",         "<cmd>Lspsaga rename<CR>",                 silent = true, remap = false },
    -- Peek definition
    -- You can edit the file containing the definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    { "gp",         "<cmd>Lspsaga peek_definition<CR>" },
    -- Go to definition
    { "gd",         "<cmd>Lspsaga goto_definition<CR>" },
    -- Show line diagnostics
    { "<leader>e",  "<cmd>Lspsaga show_line_diagnostics<CR>" },
    -- Show cursor diagnostic
    { "<leader>e",  "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
    -- Diagnsotic jump
    { "[E",         "<cmd>Lspsaga diagnostic_jump_next<CR>" },
    { "]E",         "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
    -- Diagnostic jump with filters such as only jumping to an error
    { "[e",
      function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end
    },
    { "]e",
      function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end
    },
    { "<leader>q",  "<cmd>Lspsaga show_buf_diagnostics<CR>" },
    { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>" },
    { "<leader>o",  "<cmd>Lspsaga outline<CR>" },
    { "K",          "<cmd>Lspsaga hover_doc<CR>",                 silent = true },
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end
}
