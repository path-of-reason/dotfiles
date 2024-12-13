return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.add({
			-- basic
			{ "<Leader>w", ":w<CR>", desc = "save" },
			{ "<Leader>1", ":q<CR>", desc = "quit" },
			{ "<Leader>q", ":bd<CR>", desc = "remove buffer" },
			{ "<Leader>e", ":Neotree toggle<CR>", desc = "toggle Neotree" },
			{ "<Leader><Tab>", ":Neotree buffers toggle<CR>", desc = "toggle Neotree buffers" },

			-- runc group
			{ "<Leader>r", group = "runners" },
			{ "<Leader>rc", ":!pwd<CR>", desc = "current path" },
			{ "<Leader>rf", ":lua RunFile()<CR>", desc = "run python, bun, rust" },
			-- { "<Leader>rm", ":lua RunPyModule()<CR>", desc = "run python module" },
			-- { "<Leader>rpa", ":lua Venv_activate()<CR>", desc = "run python venv activate" },
			-- { "<Leader>rpd", ":lua Venv_deactivate()<CR>", desc = "run python venv deactivate" },

			-- terminal
			{ "<leader>t", group = "terminal & theme" },
			{ "<leader>tf", ":ToggleTerm direction=float<CR>", desc = "f term" },
			{ "<leader>tv", ":ToggleTerm direction=horizontal<CR>", desc = "h term" },
			{ "<leader>ts", ":ToggleTerm direction=vertical<CR>", desc = "v term" },
			{ "<leader>tt", ":Themery<CR>", desc = "themery" },
			{ "<C-\\>", "<Esc>:ToggleTerm<CR>", desc = "ToggleTerm" },
			{ "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", desc = "ToggleTerm", mode = "t" },
			{ "<C-q>", "<C-\\><C-n>", desc = "term focus out", mode = "t" },

			{ "<leader>h", group = "help" },
			-- search
			{ "<leader>s", group = "search & split" },
			{ "<Leader>sh", ":sp<CR>", desc = "split horizontal" },
			{ "<Leader>sv", ":vsp<CR>", desc = "split vertical" },

			-- parser
			{ "<leader>p", group = "parser" },
			{ "<Leader>pt", ":InspectTree<CR>", desc = "parser tree" },
			{ "<Leader>pq", ":EditQuery<CR>", desc = "parser query" },

			-- undo tree
			{ "<Leader>u", ":UndotreeToggle<CR>", desc = "toggle undo tree" },
		})
	end,
	keys = {},
}
