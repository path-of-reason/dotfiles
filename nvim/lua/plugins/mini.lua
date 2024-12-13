return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.icons").setup({
			icons = {
				-- 아이콘 스타일 설정 ('glyph' 또는 'ascii')
				style = "glyph", -- 'glyph' 스타일을 기본값으로 사용
				-- 각 카테고리별로 설정을 추가할 수 있습니다. 예시:
				default = {}, -- 기본 설정
				directory = {}, -- 디렉토리 설정
				extension = {}, -- 파일 확장자별 설정
				file = {}, -- 파일별 설정
				filetype = {}, -- 파일 유형별 설정
				lsp = {}, -- LSP 관련 설정
				os = {}, -- 운영체제 관련 설정
				-- 파일 확장자를 기반으로 아이콘을 사용할지 말지 제어하는 함수
				use_file_extension = function(ext, file)
					return true -- 여기서 'true'를 반환하면 모든 파일 확장자에 대해 아이콘을 사용
				end,
			},
		})
	end,
}

-- https://github.com/echasnovski/mini.nvim/tree/main?tab=readme-ov-file#installation
