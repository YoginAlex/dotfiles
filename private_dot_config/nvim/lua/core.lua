-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.termguicolors = true

-- Tabs settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.o.guicursor = "n-c-v:block-blinkwait150-blinkon50-blinkoff150,i-ci:ver60-blinkwait300-blinkon200-blinkoff150"
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "120"

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
-- require('onedark').setup {
--   ending_tildes = true,
--   style = 'dark',
--   code_style = {
--     namespaces = 'none',
--     comments = 'italic',
--     keywords = 'none',
--     functions = 'italic',
--     strings = 'none',
--     variables = 'none'
--   },
--   highlights = {
--     TSConstructor = { fmt = "none" },
--   }
-- }
-- 
--
--
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.opt.keymap = "russian-jcukenwin"
vim.opt.iminsert = 0
vim.opt.imsearch = 0
