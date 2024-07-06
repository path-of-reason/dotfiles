return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		-- config = function()
		-- vim.cmd([[colorscheme catppuccin]])
		-- end,
		priority = 1000,
	},
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("solarized")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("solarized-osaka")
		end,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("nordic").load()
		end,
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
			vim.cmd.colorscheme("lackluster-hack") -- my favorite
			-- vim.cmd.colorscheme("lackluster-mint")
		end,
	},
}
