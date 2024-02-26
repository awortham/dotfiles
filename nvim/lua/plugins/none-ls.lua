-- Define the global variable
vim.g.auto_formatting_enabled = 1

-- Function to toggle auto-formatting
local function toggle_auto_formatting()
	vim.g.auto_formatting_enabled = vim.g.auto_formatting_enabled == 1 and 0 or 1

	print("Auto-formatting is " .. (vim.g.auto_formatting_enabled == 1 and "enabled" or "disabled"))
end

-- Define a Neovim command to toggle auto-formatting
vim.api.nvim_create_user_command("ToggleAutoFormat", toggle_auto_formatting, {})

local async_formatting = function(bufnr)
	if vim.g.auto_formatting_enabled == 0 then
		return
	end

	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		vim.lsp.util.make_formatting_params({}),
		function(err, res, ctx)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end

return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = { "mason.nvim" },
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.standardrb,
				null_ls.builtins.formatting.standardrb,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.prettier,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePost", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							async_formatting(bufnr)
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
	end,
}
