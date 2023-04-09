-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Packer
  -- use 'wbthomason/packer.nvim'
  -- Git
  -- use 'tpope/vim-fugitive'
  -- Copilot
  -- use 'github/copilot.vim'

  -- Add git related info in the signs columns and popups
  -- use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Highlight, edit, and navigate code
  -- use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Theme
  -- use 'navarasu/onedark.nvim'
  -- Fancier statusline
  -- use 'nvim-lualine/lualine.nvim'
  -- A high-performance color highlighter
  -- use "norcalli/nvim-colorizer.lua"
  -- Tabbars
  -- use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

  -- Add indentation guides even on blank lines
  -- use 'lukas-reineke/indent-blankline.nvim'
  --
  -- Collection of configurations for built-in LSP client
  -- use 'neovim/nvim-lspconfig'
  -- Automatically install and update language servers
  -- use 'williamboman/nvim-lsp-installer'
  -- LSP completion
  -- use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
  -- use 'jose-elias-alvarez/null-ls.nvim'

  -- Fuzzy Finder (files, lsp, etc)
  -- use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
  -- use { "nvim-telescope/telescope-file-browser.nvim" }

  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }

  -- use "windwp/nvim-ts-autotag"

  -- use "max397574/better-escape.nvim"
  -- use "folke/which-key.nvim"
  -- use "kyazdani42/nvim-web-devicons"

  -- use { "AckslD/nvim-neoclip.lua", requires = { 'nvim-telescope/telescope.nvim' } }

  -- use {
  --   "folke/twilight.nvim",
  --   config = function()
  --     require("twilight").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }

  -- use "lukas-reineke/lsp-format.nvim"
  -- use 'glepnir/dashboard-nvim'
  -- use 'mhinz/vim-startify'

  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons', -- optional
  --   },
  -- }

  -- use({
  --   "L3MON4D3/LuaSnip",
  --   -- follow latest release.
  --   tag = "v<CurrentMajor>.*",
  --   -- install jsregexp (optional!:).
  --   run = "make install_jsregexp"
  -- })

  -- "gc" to comment visual regions/lines
  -- use 'numToStr/Comment.nvim'
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- }
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua", "nvim-cmp" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end
  -- }
  use({
    "glepnir/lspsaga.nvim",
    -- opt = true,
    branch = "main",
    -- event = "LspAttach",
    -- config = function()
    --   require("lspsaga").setup({})
    -- end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  })
  --


  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
