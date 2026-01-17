local map = require("utils.keyMapper").map
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				-- "elixir",
				-- "heex",
				-- "javascript",
				-- "typescript",
				"svelte",
				"toml",
				-- "clojure",
				"css",
				"html",
				"markdown",
				"markdown_inline",
				"latex",
				"rust",
				"zig",
			},
			sync_install = false,
			highlight = { enable = true },
			-- indent = { enable = true, disable = { "javascript", "typescript", "svelte" } },
			modules = {},
			ignore_install = {},
			auto_install = false,
		})
	end,
}
