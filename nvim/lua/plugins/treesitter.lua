return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				sync_install = false,
				-- commenting this option out make the gf command for vim-rails work.
				-- I'm not yet sure if turning this off effects anything in treesitter
				-- highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
