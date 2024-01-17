return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "cwebster2/github-coauthors.nvim"
    },

    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})

      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      vim.keymap.set("n", "<leader>gco", function()
        return require("telescope").extensions.githubcoauthors.coauthors()
      end, {})

      vim.keymap.set("n", "<leader>co", function()
        require('telescope.builtin').find_files({cwd="~/.config/ScratchVim"})
      end, {})

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,                -- move to previous result
              ["<C-j>"] = actions.move_selection_next,                    -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, 
            },
          },

          file_ignore_patterns = {
            "node_modules",
            ".git",
            "vendor",
            ".lock",
            "tmp",
            "import_data_samples",
            "legacy_invoices",
            "tasting_notes",
            ".csv",
            "public/assets"
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
