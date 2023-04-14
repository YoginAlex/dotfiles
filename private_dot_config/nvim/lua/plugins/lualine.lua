return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        shorting_target = 40,
      },
      sections = {
        lualine_b = { 'diff', 'branch' },
        lualine_c = { { 'filename', path = 0, file_status = true } },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'filetype' },
        lualine_z = { 'location', 'progress' },
      },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
