return {
  "FabijanZulj/blame.nvim",
  config = function()
    require("blame").setup({
      format_fn = require("blame.formats.default_formats").commit_date_author_fn,
    })
  end,
  keys = {
    { "<leader>gB", "<cmd>BlameToggle<cr>", desc = "Git Blame" },
  },
}
