-- Define a global variable to hold whether or not we want to format on save
vim.g.format_on_save = 1

-- Function to toggle auto-formatting on save
local function toggle_format_on_save()
  local noice = require("noice")

  vim.g.format_on_save = vim.g.format_on_save == 1 and 0 or 1

  local message = ""

  if vim.g.format_on_save == 1 then
    message = "Formatting on save is now enabled"
  else
    message = "Formatting on save is now disabled"
  end

  noice.notify(message)
end

-- Define a Neovim command to toggle auto-formatting on save
vim.api.nvim_create_user_command("ToggleFormattingOnSave", toggle_format_on_save, {})

-- Lightweight yet powerful formatter plugin for Neovim
-- Info source: https://youtu.be/ybUE4D80XSk
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- disabling, for now - waiting on: https://github.com/nebulab/erb-formatter/issues/47
        -- eruby = { "erb_formatter" },
        html = { "prettier" },
      },
      format_on_save = function()
        return {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
          dry_run = vim.g.format_on_save == 0,
        }
      end,
      formatters = {
        erb_formatter = {
          command = "erb-format",
          args = { "--stdin" },
        }
      }
    })
  end,
}
