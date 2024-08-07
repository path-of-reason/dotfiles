local map = require("utils.keyMapper").map
return {
	-- fold plugin
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		local v = vim
		v.o.foldcolumn = "0" -- '0' is not bad
		v.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		v.o.foldlevelstart = 99
		v.o.foldenable = true

		local ufo = require("ufo")
		local capabilities = v.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
				-- you can add other fields for setting up lsp server in this table
			})
		end
		require("ufo").setup()

		map("zR", ufo.openAllFolds)
		map("zM", ufo.closeAllFolds)
	end,
}
