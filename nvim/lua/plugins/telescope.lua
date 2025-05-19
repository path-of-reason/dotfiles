local map = require("utils.keyMapper").map

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", "src-tauri" },
					find_command = {
						"rg",
						"--files",
						"--glob",
						"!node_modules/**",
						"--glob",
						"!src-tauri/**",
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--glob=!node_modules/**",
						"--glob=!src-tauri/**",
					},
				},
			})
			-- local builtin = require("telescope.builtin")
			-- local wk = require("which-key")
			-- wk.add({
			-- 	{ "<leader>s", group = "search & split" },
			-- 	{ "<leader>sf", builtin.find_files, desc = "search file" },
			-- 	{ "<leader>st", builtin.live_grep, desc = "search text" },
			-- 	{ "<leader>sb", builtin.buffers, desc = "search buffer" },
			-- })
			-- map("<leader>hf", builtin.help_tags) -- help function
			-- map("<leader>hk", builtin.keymaps) -- help keymap
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
