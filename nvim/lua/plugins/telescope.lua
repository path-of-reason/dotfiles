local map = require("utils.keyMapper").map

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local wk = require("which-key")
			wk.add({
				{ "<leader>s", group = "search & split" },
				{ "<leader>sf", builtin.find_files, desc = "search file" },
				{ "<leader>st", builtin.live_grep, desc = "search text" },
				{ "<leader>sb", builtin.buffers, desc = "search buffer" },
			})

			map("<leader>hf", builtin.help_tags) -- help function
			map("<leader>hk", builtin.keymaps) -- help keymap
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
