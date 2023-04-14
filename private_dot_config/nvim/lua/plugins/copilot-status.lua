return {
  "jonahgoldwastaken/copilot-status.nvim",
  dependencies = { "zbirenbaum/copilot.lua" },
  lazy = true,
  config = function()
    require("copilot_status").setup()
  end,
}
