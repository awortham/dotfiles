vim.g["test#strategy"] = "neovim"
vim.g["test#ruby#use_binstubs"] = 0
vim.g["test#ruby#use_spring_binstub"] = 0
vim.g["test#preserve_screen"] = 1

return {
	"janko/vim-test",
	event = "VeryLazy",
	keys = {
		{ "<leader>s", ":TestNearest<CR>" },
		{ "<leader>t", ":TestFile<CR>" },
		{ "<leader>a", ":TestSuite<CR>" },
		{ "<CR>", ":TestLast<CR>" },
	},
}
