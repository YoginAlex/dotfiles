return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  init = function()
    vim.opt.list = true
    require("indent_blankline").setup({
      space_char_blankline = " ",
      show_current_context = true,
      show_trailing_blankline_indent = false,
    })
  end,
}
