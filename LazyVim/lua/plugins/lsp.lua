return {
  {
    "neovim/nvim-lspconfig",

    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
      -- disable a keymap
      keys[#keys + 1] = { "gd", false }

      -- I want this added because I turned it off above
      -- keys[#keys + 1] = { "<leader>gd", "vim.lsp.buf.definition" }
      -- keys[#keys + 1] = { "<leader>gd", "<cmd><cr>" }

      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,

    opts = {
      servers = {
        dockerls = {
          settings = {
            docker = {
              languageserver = {
                formatter = {
                  ignoreMultilineInstructions = true,
                },
              },
            },
          },
        },
      },
    },

    -- init = function()
    -- vim.lsp.set_log_level("debug")
    -- end,
  },
}
