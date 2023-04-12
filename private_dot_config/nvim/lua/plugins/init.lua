return {
  { "tpope/vim-fugitive" },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  { "windwp/nvim-ts-autotag" },
  {
    "max397574/better-escape.nvim",
    config = function() require("better_escape").setup({ mapping = { "jj", "jk" } }) end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }
}
