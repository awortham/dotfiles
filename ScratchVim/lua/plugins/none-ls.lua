return {
	"nvimtools/none-ls.nvim",
  dependencies = { "mason.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.standardrb,
				null_ls.builtins.formatting.standardrb,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.prettier,
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
	end,
}
