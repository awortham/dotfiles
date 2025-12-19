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
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("ruby_lsp", {
				init_options = {
					addonSettings = {
						["Ruby LSP Rails"] = {
							enablePendingMigrationsPrompt = false,
						},
					},
				},
			})
			vim.lsp.enable("ruby_lsp")

			vim.lsp.config("ts_ls", {})
			vim.lsp.enable("ts_ls")

			vim.lsp.config("standardrb", {})
			vim.lsp.enable("standardrb")

			vim.lsp.config("stimulus_ls", {})
			vim.lsp.enable("stimulus_ls")

			vim.lsp.config("eslint", {
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
			vim.lsp.enable("eslint")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
