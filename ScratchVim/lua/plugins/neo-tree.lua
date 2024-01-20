local keymap = vim.keymap

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    keymap.set("n", "<leader>e", ":Neotree filesystem reveal toggle left<CR>");

    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      }
    })
  end
}
