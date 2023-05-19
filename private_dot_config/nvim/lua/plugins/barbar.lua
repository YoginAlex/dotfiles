return {
  "romgrk/barbar.nvim",
  dependencies = { "nvim-web-devicons" },
  lazy = false,
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- Enable/disable animations
    animation = true,
    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = true,
    -- Enable/disable current/total tabpages indicator (top right corner)
    tabpages = false,
    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = true,
    icons = {
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'E' },
        [vim.diagnostic.severity.WARN] = { enabled = true, icon = 'W' },
        [vim.diagnostic.severity.INFO] = { enabled = false },
        [vim.diagnostic.severity.HINT] = { enabled = false },
      },
      gitsigns = {
        added = { enabled = true, icon = '+' },
        changed = { enabled = true, icon = '~' },
        deleted = { enabled = true, icon = '-' },
      },
      --   -- Configure the base icons on the bufferline.
      buffer_index = 'superscript',
    },
    -- -- If set, the letters for each buffer in buffer-pick mode will be
    -- -- assigned based on their name. Otherwise or in case all letters are
    -- -- already assigned, the behavior is to assign letters in order of
    -- -- usability (see order below)
    semantic_letters = false,
    -- -- New buffer letters are assigned in this order. This order is
    -- -- optimal for the qwerty keyboard layout but might need adjustement
    -- -- for other layouts.
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  },
  keys = {
    { "<M-,>",      "<cmd>BufferPrevious<CR>" },
    { "<M-.>",      "<cmd>BufferNext<CR>" },
    { "<leader>bh", "<cmd>BufferMovePrevious<CR>" },
    { "<leader>bl", "<cmd>BufferMoveNext<CR>" },
    { "<M-1>",      "<Cmd>BufferGoto 1<CR>" },
    { "<M-2>",      "<Cmd>BufferGoto 2<CR>" },
    { "<M-3>",      "<Cmd>BufferGoto 3<CR>" },
    { "<M-4>",      "<Cmd>BufferGoto 4<CR>" },
    { "<M-5>",      "<Cmd>BufferGoto 5<CR>" },
    { "<M-6>",      "<Cmd>BufferGoto 6<CR>" },
    { "<M-7>",      "<Cmd>BufferGoto 7<CR>" },
    { "<M-8>",      "<Cmd>BufferGoto 8<CR>" },
    { "<M-9>",      "<Cmd>BufferGoto 9<CR>" },
    { "<M-0>",      "<Cmd>BufferLast<CR>" },
    { "<M-c>",      "<Cmd>BufferClose<CR>" },
    { "<C-p>",      "<Cmd>BufferPick<CR>" }
  }
}
