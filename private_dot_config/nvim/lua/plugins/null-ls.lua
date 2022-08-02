local null_ls = require('null-ls')

null_ls.setup({
  -- debug = true,
  -- save_after_format = true,
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.formatting.stylelint,
    null_ls.builtins.diagnostics.eslint_d
  }
})
