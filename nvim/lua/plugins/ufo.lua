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
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = (" 󰁂 %d "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { suffix, "MoreMsg" })
			return newVirtText
		end
		ufo.setup({

			fold_virt_text_handler = handler,
			-- provider_selector = function(_, filetype, _)
			-- 	return { "lsp", "indent" }
			-- end,
			-- fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			-- 	local newVirtText = {}
			-- 	local suffix = " { ... } " -- 원하는 폴딩 텍스트
			-- 	local sufWidth = vim.fn.strdisplaywidth(suffix)
			-- 	local targetWidth = width - sufWidth
			-- 	local curWidth = 0
			--
			-- 	for _, chunk in ipairs(virtText) do
			-- 		local chunkText = chunk[1]
			-- 		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- 		if targetWidth > curWidth + chunkWidth then
			-- 			table.insert(newVirtText, chunk)
			-- 			curWidth = curWidth + chunkWidth
			-- 		else
			-- 			chunkText = truncate(chunkText, targetWidth - curWidth)
			-- 			table.insert(newVirtText, { chunkText, chunk[2] })
			-- 			curWidth = curWidth + vim.fn.strdisplaywidth(chunkText)
			-- 			break
			-- 		end
			-- 	end
			-- 	table.insert(newVirtText, { suffix, "Comment" })
			-- 	return newVirtText
			-- end,
		})

		map("zR", ufo.openAllFolds)
		map("zM", ufo.closeAllFolds)
	end,
}
