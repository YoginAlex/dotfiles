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
  config = function()
    require("neoclip").setup({
      enable_persistent_history = true,
      continuous_sync = true
    })
  end
}
