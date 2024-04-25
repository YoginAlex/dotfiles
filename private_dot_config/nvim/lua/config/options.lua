-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 5

-- Tabs settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "120"

-- vim.o.guicursor = "n-c-v:block-blinkwait150-blinkon50-blinkoff150,i-ci:ver60-blinkwait300-blinkon200-blinkoff150"

vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

vim.opt.clipboard = ""
