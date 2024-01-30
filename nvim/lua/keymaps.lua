  local keymap = vim.keymap

  keymap.set("n", "x", '"_x')
  keymap.set("i", "jj", "<ESC>")
  keymap.set("n", "<leader>v", "<C-w>v<C-w><C-w>")
  keymap.set("n", "<leader>h", "<C-w>s<C-w><C-w>")
  keymap.set("n", "<leader>T", ":tabnew %<Return>")
  keymap.set("n", "<leader>r", ":noh<cr>")
  keymap.set("n", "0", "^")
