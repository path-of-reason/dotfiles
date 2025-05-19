return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					"cyberdream",
					"rose-pine",
					"darkvoid",
					"oh-lucy",
					"tokyonight",
					-- "tokyonight-night",
					-- "tokyonight-storm",
					-- "tokyonight-day",
					-- "tokyonight-moon",
					-- "catppuccin",
					-- "catppuccin-frappe",
					-- "catppuccin-latte",
					-- "catppuccin-macchiato",
					-- "catppuccin-mocha",
					"solarized-osaka",
					-- "lackluster",
					-- "lackluster-dark",
					-- "lackluster-hack",
					"lackluster-mint",
					-- "lackluster-night",
					-- "nordic",
				}, -- 설치된 컬러스킴 목록
				livePreview = true, -- 테마 선택 시 바로 적용. 기본값은 true
			})
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "aliqyan-21/darkvoid.nvim" },
	{ "Yazeed1s/oh-lucy.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
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
