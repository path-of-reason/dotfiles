local map = require("utils.keyMapper").map
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"html",
					"jsonls",
					"markdown_oxide",
					"pylsp",
					"rust_analyzer",
					"svelte",
					"taplo",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.markdown_oxide.setup({})
			lspconfig.pylsp.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.svelte.setup({})
			lspconfig.taplo.setup({})
			lspconfig.tailwindcss.setup({})

			map("K", vim.lsp.buf.hover)
			map("gd", vim.lsp.buf.definition)
			map("<leader>la", vim.lsp.buf.code_action)
		end,
	},
}
