return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-lspconfig").setup({
        -- ensure_installed = { "lua_ls", "ruby_lsp", "erb-formatter", "erb-lint" },
        ensure_installed = { "lua_ls", "ruby_lsp" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.standardrb.setup({})
      -- disabling, for now - this was causing my erb templates to throw linting errors all over them. Gross 😅
      -- lspconfig.ruby_lsp.setup({})
      lspconfig.stimulus_ls.setup({}) -- not sure how to use this yet 😅
      lspconfig.eslint.setup({
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
