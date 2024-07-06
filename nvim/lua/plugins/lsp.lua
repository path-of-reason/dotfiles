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
			local v = vim
			lspconfig.lua_ls.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.markdown_oxide.setup({})
			lspconfig.pylsp.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.svelte.setup({})
			lspconfig.taplo.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.tsserver.setup({})

			-- LSP가 연결된 후에 인레이 힌트를 활성화하는 자동 명령 설정
			-- v.api.nvim_create_autocmd("LspAttach", {
			-- 	callback = function(args)
			-- 		local client = v.lsp.get_client_by_id(args.data.client_id)
			-- 		if client.server_capabilities.inlayHintProvider then
			-- 			v.lsp.inlay_hint.enable()
			-- 		end
			-- 	end,
			-- })

			map("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
			map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
			-- 이걸로 하면 리스타트 할때마다 오류나던데..
			-- map("K", v.lsp.buf.hover)
			-- map("gd", v.lsp.buf.definition)
			-- map("<leader>la", v.lsp.buf.code_action)
			map("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			map("<leader>ld", v.diagnostic.setqflist)
			map("<leader>lr", ":LspRestart<CR>")

			map("gl", v.diagnostic.open_float)
			map("gv", function()
				v.cmd([[vsplit]])
				v.cmd([[wincmd l]])
				v.lsp.buf.definition()
			end)

			-- map("<leader>ld", "<cmd>lua v.diagnostic.setqflist({ severity = v.diagnostic.severity.WARN })<CR>")
		end,
	},
}
