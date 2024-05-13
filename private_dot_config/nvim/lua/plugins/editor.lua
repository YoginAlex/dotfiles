return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "folke/trouble.nvim" },
    opts = {
      defaults = {
        mappings = {
          n = {
            ["dd"] = require("telescope.actions").delete_buffer,
            ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<C-q>"] = require("telescope.actions").send_to_qflist,
          },
          i = {
            ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<C-q>"] = require("telescope.actions").send_to_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          layout_strategy = "vertical",
        },
      },
    },
    keys = {
      { "<leader>,", LazyVim.telescope("files"), desc = "Find Files (Root Dir)" },
      {
        "<leader><space>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
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

  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xQ", false },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = function(_, opts)
      vim.opt.updatetime = 200

      return {
        -- create_autocmd = false,
        show_dirname = false,
        show_modified = true,
        -- modifiers = {
        --   dirname = ":s?.*??",
        -- },
      }
    end,
  },
}
