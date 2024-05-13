return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        fish = {},
        sh = { "shfmt" },
        css = { "stylelint", { "prettierd", "prettier" } },
      },
    },
  },
}
