-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
require('indent_blankline').setup {
  space_char_blankline = " ",
  -- show_end_of_line = true,
  show_current_context = true,
  show_trailing_blankline_indent = false,
}
