-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<M-j>', ':m .+1<CR>==', { silent = true })
vim.keymap.set('n', '<M-k>', ':m .-2<CR>==', { silent = true })
vim.keymap.set('i', '<M-j>', '<Esc>:m .+1<CR>==gi', { silent = true })
vim.keymap.set('i', '<M-k>', '<Esc>:m .-2<CR>==gi', { silent = true })
vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { silent = true })
-- vim.keymap.set({ 'n' }, '<F2>', ':set invpaste paste?<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l', { silent = true })

vim.opt.pastetoggle = '<F2>'
