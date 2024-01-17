-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>v", "<Leader>w|", {})
vim.api.nvim_set_keymap("n", "<Leader>h", "<Leader>-", {})
vim.api.nvim_set_keymap("n", "<Leader>T", ":tabnew %<Return>", {})
vim.api.nvim_set_keymap("n", "<leader>r", ":noh<cr>", {})
