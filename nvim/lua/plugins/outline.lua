return {
	"hedyhli/outline.nvim",
	config = function()
		require("outline").setup({})

		-- 문서 버퍼(:q 등으로 나갈 때)마다 outline이 열려있고
		-- 남아있는 버퍼가 outline 뿐이면 자동으로 outline도 닫는다
		-- vim.api.nvim_create_autocmd("BufWinLeave", {
		-- 	callback = function()
		-- 		local outline = require("outline")
		-- 		if outline.is_open and outline.is_open() then
		-- 			local listed = vim.fn.getbufinfo({ buflisted = 1 })
		-- 			if #listed == 1 then
		-- 				-- outline 창 닫기
		-- 				outline.close()
		-- 			end
		-- 		end
		-- 	end,
		-- 	desc = "문서 버퍼가 다 닫힐 때 outline도 닫기",
		-- })
		vim.api.nvim_create_autocmd("BufWinLeave", {
			callback = function()
				local outline = require("outline")
				if outline.is_open and outline.is_open() then
					outline.close()
				end
			end,
			desc = "어떤 버퍼든 닫힐 때 outline도 같이 닫기",
		})
		-- vim.api.nvim_create_autocmd("BufWinLeave", {
		-- 	group = vim.api.nvim_create_augroup("OutlineAutoClose", { clear = true }),
		-- 	callback = function()
		-- 		-- Check if this is the last normal buffer
		-- 		local normal_buffers = 0
		-- 		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- 			if vim.api.nvim_buf_is_loaded(buf) then
		-- 				local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
		-- 				local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
		-- 				-- Count only normal document buffers (not outline, quickfix, etc.)
		-- 				if buftype == "" and filetype ~= "outline" then
		-- 					normal_buffers = normal_buffers + 1
		-- 				end
		-- 			end
		-- 		end
		--
		-- 		-- If no normal buffers remain, close outline window
		-- 		if normal_buffers == 0 then
		-- 			vim.schedule(function()
		-- 				require("outline").close()
		-- 			end)
		-- 		end
		-- 	end,
		-- })
	end,
}
