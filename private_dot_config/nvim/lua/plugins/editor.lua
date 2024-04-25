return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        file_browser = {
          layout_strategy = "vertical",
        },
      },
    },
    keys = {
      { "<leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>" },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>n", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    },
  },
}
