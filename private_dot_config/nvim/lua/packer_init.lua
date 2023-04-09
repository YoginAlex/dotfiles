-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter

  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer' -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } } -- Autocompletion
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } } -- Snippet Engine and Snippet Expansion
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder (files, lsp, etc)
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use "norcalli/nvim-colorizer.lua"

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  use "max397574/better-escape.nvim"
  use "folke/which-key.nvim"
  use "kyazdani42/nvim-web-devicons"

  -- use 'Pocco81/TrueZen.nvim'
  use { "AckslD/nvim-neoclip.lua", requires = { 'nvim-telescope/telescope.nvim' } }
  use { 'mg979/vim-visual-multi', branch = "master" }
  -- }

  use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
        require("lspsaga").setup {}
      end,
      requires = {
          { "nvim-tree/nvim-web-devicons" },
          --Please make sure you install markdown and markdown_inline parser
          { "nvim-treesitter/nvim-treesitter" }
      }
  })

  use({
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
      end
  })

  use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
      end
  }
  if is_bootstrap then
    require('packer').sync()
  end

  use "lukas-reineke/lsp-format.nvim"
  -- use 'glepnir/dashboard-nvim'
  use 'mhinz/vim-startify'
end)
-- stylua: ignore end

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
