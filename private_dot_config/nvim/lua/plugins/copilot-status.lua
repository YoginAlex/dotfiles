return {
  "jonahgoldwastaken/copilot-status.nvim",
  dependencies = { "zbirenbaum/copilot.lua" },
  lazy = false,
  config = function()
    require("copilot_status").setup()
  end,
}
