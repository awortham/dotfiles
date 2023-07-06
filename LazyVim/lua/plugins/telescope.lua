local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "cwebster2/github-coauthors.nvim" },

    keys = function(_, keys)
      vim.list_extend(keys, {
        {
          "<C-p>",
          Util.telescope("files"),
          desc = "Find Files (root dir)",
        },
        {
          "<leader>fc",
          function()
            return require("telescope").extensions.githubcoauthors.coauthors()
          end,
          desc = "Add coauthors",
        },
      })
    end,
  },
}
