-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
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
  }
}
