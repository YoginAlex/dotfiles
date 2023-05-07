return {
  "AckslD/nvim-neoclip.lua",
  lazy = false,
  dependencies = {
    {
      "kkharji/sqlite.lua",
      module = "sqlite"
    },
    { "nvim-telescope/telescope.nvim" }
  },
  opts = {
    enable_persistent_history = true,
    continuous_sync = true,
    preview = true,
    content_spec_column = true
  },
  config = function(_, opts)
    require("neoclip").setup(opts)
  end
}
