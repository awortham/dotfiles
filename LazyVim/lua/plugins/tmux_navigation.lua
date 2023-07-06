return {
  {
    "alexghergh/nvim-tmux-navigation",

    keys = {
      {
        "<C-h>",
        function()
          return require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
        end,
      },
      {
        "<C-j>",
        function()
          return require("nvim-tmux-navigation").NvimTmuxNavigateDown()
        end,
      },
      {
        "<C-k>",
        function()
          return require("nvim-tmux-navigation").NvimTmuxNavigateUp()
        end,
      },
      {
        "<C-l>",
        function()
          return require("nvim-tmux-navigation").NvimTmuxNavigateRight()
        end,
      },
    },
  },
}
