return {
  { "nvim-telescope/telescope-fzf-native.nvim",   build = "make", lazy = false },
  { "nvim-telescope/telescope-file-browser.nvim", lazy = false },
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>?",
        require("telescope.builtin").oldfiles,
        desc = "[?] Find recently opened files"
      },
      { "<leader><space>", require("telescope.builtin").buffers,                      desc = "[ ] Find existing buffers" },
      { "<leader>sf",      require("telescope.builtin").find_files,                   desc = "[S]earch [F]iles" },
      { "<leader>sh",      require("telescope.builtin").help_tags,                    desc = "[S]earch [H]elp" },
      { "<leader>sw",      require("telescope.builtin").grep_string,                  desc = "[S]earch current [W]ord" },
      { "<leader>sg",      require("telescope.builtin").live_grep,                    desc = "[S]earch by [G]rep" },
      { "<leader>sd",      require("telescope.builtin").diagnostics,                  desc = "[S]earch [D]iagnostics" },
      { "<leader>su",      require("telescope").extensions.file_browser.file_browser, desc = "[S]earch c[u]rrent" },
      {
        "<leader>/",
        "<cmd>Telescope neoclip<CR>",
        desc = "[/] Search clipboard history"
      },
    },
    opts = function()
      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }
      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don"t want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!.git/*")

      local actions = require "telescope.actions"
      local fb_actions = require("telescope").extensions.file_browser.actions

      return {
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
          vimgrep_arguments = vimgrep_arguments,
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.5,
              results_width = 0.5,
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
            -- hidden = true,
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
            layout_strategy = "vertical",
          },
          buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
          },
        },
        extensions = {
          file_browser = {
            layout_strategy = "vertical",
            path = "%:p:h",
            mappings = {
              i = {
                ["<C-t>"] = actions.select_tab,
                ["<C-z>"] = fb_actions.change_cwd,
              },
              n = {
                t = actions.select_tab,
                z = fb_actions.change_cwd,
              },
            },
          }
        }
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("neoclip")
      require("telescope").load_extension("file_browser")
    end,
  }
}
