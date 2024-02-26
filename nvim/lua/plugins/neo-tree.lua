-- note: using the 'delete' button moves you up a level or directory
local keymap = vim.keymap

return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		keymap.set("n", "<leader>e", ":Neotree filesystem reveal toggle left<CR>")

		-- I'd like to figure out how to get a more full path to files when moving them in the tree
		-- maybe this

		-- filesystem = {
		--   find_by_full_path_words = false,
		-- }
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						require("neo-tree").close_all()
					end,
				},
			},
			window = {
				mappings = {
					["P"] = function(state)
						local node = state.tree:get_node()
						require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
					end,
				},
			},
		})
	end,
}
