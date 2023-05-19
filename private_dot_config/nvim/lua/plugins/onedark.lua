return {
  "navarasu/onedark.nvim",
  priority = 1000, -- Ensure it loads first
  opts = {
    ending_tildes = true,
    style = 'dark',
    code_style = {
      namespaces = 'none',
      comments = 'italic',
      keywords = 'none',
      functions = 'italic',
      strings = 'none',
      variables = 'none'
    },
    highlights = {
      TSConstructor = { fmt = "none" },
    }
  },
  config = function(_, opts)
    require("onedark").setup(opts)
  end,
  -- init = function()
  --   vim.cmd("colorscheme onedark")
  -- end,
}
