return {
	"nvim-focus/focus.nvim",
	version = "*",
	config = function()
		require("focus").setup({
			enable = true, -- 플러그인 활성화
			commands = true, -- Focus 관련 명령어 활성화

			-- 자동 크기 조절
			autoresize = {
				enable = true, -- 자동 크기 조절 활성화
				width = 0, -- 포커스된 창의 강제 가로 크기 (0이면 기본값 사용)
				height = 0, -- 포커스된 창의 강제 세로 크기 (0이면 기본값 사용)
				minwidth = 30, -- 포커스되지 않은 창의 최소 가로 크기
				minheight = 10, -- 포커스되지 않은 창의 최소 세로 크기
				height_quickfix = 10, -- QuickFix 창의 높이 설정 (기본값: 10줄)
			},

			-- 창 분할 설정
			split = {
				bufnew = false, -- 새로운 빈 버퍼를 열 때 자동으로 새 창을 만들지 여부
				tmux = false, -- Tmux 창을 사용해 창을 분할할지 여부
			},

			-- UI 설정
			ui = {
				-- number = true, -- 포커스된 창에서만 줄 번호 표시
				-- relativenumber = true, -- 포커스된 창에서만 상대 줄 번호 표시
				hybridnumber = true, -- 포커스된 창에서 하이브리드 번호(절대+상대) 사용 여부
				absolutenumber_unfocussed = false, -- 포커스되지 않은 창에서도 절대 번호 유지 여부

				cursorline = true, -- 포커스된 창에서만 커서라인 강조 표시
				cursorcolumn = false, -- 포커스된 창에서만 커서 컬럼 강조 표시
				colorcolumn = {
					enable = false, -- 포커스된 창에서 컬럼 강조선 표시 여부
					list = "+1", -- 강조할 컬럼 위치 (기본적으로 커서 기준 +1)
				},
				signcolumn = true, -- 포커스된 창에서만 `signcolumn` 표시 여부
				winhighlight = true, -- 포커스된 창과 비포커스 창을 자동으로 하이라이트할지 여부
			},
		})
	end,
}
