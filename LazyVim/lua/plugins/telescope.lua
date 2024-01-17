local Util = require("lazyvim.util")
local actions = require("telescope.actions")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "cwebster2/github-coauthors.nvim" },
    keys = function(_, keys)
      vim.list_extend(keys, {
        {
          "<C-p>",
          Util.telescope("files"),
          desc = "Find Files (root dir)",
        },
        {
          "<leader>gco",
          function()
            return require("telescope").extensions.githubcoauthors.coauthors()
          end,
          desc = "Add coauthors",
        },
      })
    end,

    opts = function(_, opts)
      opts.defaults.mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          -- ["<c-t>"] = function(...)
          --   return require("trouble.providers.telescope").open_with_trouble(...)
          -- end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<C-a>"] = "select_all",
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      }

      opts.defaults.pickers = {
        buffers = {
          sort_mru = true,
        },
      }
    end,
  },
}
--
-- {
--           "<C-j",
--           actions.move_selection_next,
--           desc = "Move selection down",
--         },
--         {
--           "<C-k",
--           actions.move_selection_previous,
--           desc = "Move selection up",
--         },
--
--mappings = {
-- i = {
-- ["<C-j>"] = actions.move_selection_next,
-- ["<C-k>"] = actions.move_selection_previous,
-- },
-- },
