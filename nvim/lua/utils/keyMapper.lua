local keyMapper = function(from, to, mode, opts)
	local options = {
		noremap = true, -- normal mode
		silent = true, -- 뭐하는지 보임
	}
	mode = mode or "n" -- 모드값을 사용하되 없으면 노멀모드에서 실행하라
	if opts then -- 매개변수에 옵션이 있다면 강제로 덥어쓰기 함
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, from, to, options)
end

return { map = keyMapper }
