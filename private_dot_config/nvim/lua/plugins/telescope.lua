local telescopeConfig = require("telescope.config")
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

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

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    vimgrep_arguments = vimgrep_arguments,
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
      -- previewer = false,
      -- theme = "dropdown",
      layout_strategy = "vertical",
      path = "%:p:h",
    }
  }
})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require('telescope').load_extension('file_browser')
vim.keymap.set("n", "<leader>su", require('telescope').extensions.file_browser.file_browser,
  { desc = '[S]earch c[u]rrent', noremap = true })
