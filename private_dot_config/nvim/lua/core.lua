-- [[ Setting options ]]
-- See `:help vim.o`
vim.opt.termguicolors = true

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
require('onedark').setup {
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
}
require('onedark').load()
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


vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.config({
      virtual_text = false,
      -- underline = false
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  else
    vim.g.diagnostics_active = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.diagnostic.config({
        virtual_text = true,
        -- underline = true
      })
    )
  end
end

vim.keymap.set({ 'n', 'v' }, '<leader>tt', ':lua toggle_diagnostics()<CR>', { silent = true })
