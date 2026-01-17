return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		-- 표(Table) 관련 핵심 설정
		pipe_table = {
			-- 'full' 스타일은 모든 테두리를 깔끔한 선으로 그려줍니다.
			-- 'overlay' 스타일은 기존 문자를 가리며 더 정교하게 그립니다.
			style = "full",
			-- 표의 수직선(|)을 어떤 문자로 대체할지 결정합니다.
			border = {
				"┌",
				"┬",
				"┐",
				"├",
				"┼",
				"┤",
				"└",
				"┴",
				"┘",
				"│",
				"─",
			},
			-- 셀 내용 앞뒤로 여백을 주어 가독성을 높입니다.
			-- cell = "padded",
			-- 표의 가로 길이를 줄여서 줄 바꿈이 일어날 확률을 낮춰줍니다.
			cell = "trimmed",
			-- 정렬 기호(:---:)를 깔끔하게 숨기거나 아이콘으로 대체합니다.
			alignment_indicator = "━",
			-- anti_conceal을 활성화하면 커서가 표 위에 있을 때
			-- 렌더링이 풀리면서 표가 덜 깨져 보이게 도와줍니다.
			anti_conceal = {
				enabled = false,
			},
		},
		-- 표 외에도 전반적인 가독성을 위한 추가 옵션
		heading = {
			-- 헤딩 앞에 예쁜 아이콘을 붙여줍니다.
			sign = true,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			-- icons = { "Ⅰ ", "Ⅱ ", "Ⅲ ", "Ⅳ ", "Ⅴ ", "Ⅵ " },
			-- icons = { "▎ ", "▎ ", "▎ ", "▏ ", "▏ ", "▏ " },
			-- 아이콘 뒤에 배경색을 살짝 넣고 싶다면 아래 옵션을 추가할 수 있습니다.
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
		},
	},
}
