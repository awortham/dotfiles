-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>gco", "iCo-authored-by: asdf <asdf@asdf.com><ESC>7b", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>v", "<C-w>v<C-w><C-w>", {})
vim.api.nvim_set_keymap("n", "<Leader>h", "<C-w>s<C-w><C-w>", {})
