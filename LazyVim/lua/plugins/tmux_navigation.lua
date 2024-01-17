return {
  {
    "aserowy/tmux.nvim",

    opts = {
      navigation = {
        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = false,
      },
    },

    keys = {
      {
        "<C-h>",
        function()
          return require("tmux").move_left()
        end,
      },
      {
        "<C-j>",
        function()
          return require("tmux").move_down()
        end,
      },
      {
        "<C-k>",
        function()
          return require("tmux").move_up()
        end,
      },
      {
        "<C-l>",
        function()
          return require("tmux").move_right()
        end,
      },
    },
  },
}

-- return {
--   {
--     "alexghergh/nvim-tmux-navigation",
--
--     keys = {
--       {
--         "<C-h>",
--         function()
--           return require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
--         end,
--       },
--       {
--         "<C-j>",
--         function()
--           return require("nvim-tmux-navigation").NvimTmuxNavigateDown()
--         end,
--       },
--       {
--         "<C-k>",
--         function()
--           return require("nvim-tmux-navigation").NvimTmuxNavigateUp()
--         end,
--       },
--       {
--         "<C-l>",
--         function()
--           return require("nvim-tmux-navigation").NvimTmuxNavigateRight()
--         end,
--       },
--     },
--   },
-- }
