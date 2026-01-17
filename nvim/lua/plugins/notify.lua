return {
	"rcarriga/nvim-notify",
	-- `lazy = false`로 설정하여 Neovim 시작 시 바로 로드되도록 합니다.
	-- 알림 플러그인은 대부분 즉시 로드되는 것이 좋습니다.
	lazy = false,
	config = function()
		require("notify").setup({
			-- 여기에 원하는 설정을 추가합니다.
			-- 예를 들어:
			stages = "fade", -- 알림 애니메이션 스타일 (fade_in_slide_out, fade, slide)
			timeout = 2000, -- 알림이 사라지는 시간 (밀리초)
			max_height = 10, -- 최대 알림 개수 (줄 수)
			max_width = 80, -- 최대 알림 너비 (문자 수)
			-- 배치를 오른쪽 상단으로 설정하는 부분
			-- 기본적으로 오른쪽 상단에 표시됩니다.
			-- 추가적인 위치 조절이 필요하면 `top` 또는 `right` 값을 설정할 수 있습니다.
			-- 예를 들어, 더 오른쪽으로 붙이려면:
			render = "compact", -- 또는 "minimal" 등 다른 렌더링 스타일
			-- top = "5%", -- 상단으로부터의 거리 (백분율)
			-- right = "5%", -- 오른쪽으로부터의 거리 (백분율)
			-- 또는 함수를 사용하여 동적으로 위치를 지정할 수도 있습니다.
			-- https://github.com/rcarriga/nvim-notify#configuration 참고
			--
			-- highlight 옵션 (색상 설정)
			highlights = {
				INFO = "NotifyInfo",
				WARN = "NotifyWarn",
				ERROR = "NotifyError",
				DEBUG = "NotifyDebug",
				TRACE = "NotifyTrace",
			},
			-- 기타 설정:
			-- on_open = function(win) end, -- 알림 창이 열릴 때 실행될 함수
			-- on_close = function(win) end, -- 알림 창이 닫힐 때 실행될 함수
		})

		-- vim.notify를 nvim-notify로 오버라이드하여 다른 플러그인에서도 nvim-notify를 사용하도록 합니다.
		vim.notify = require("notify")
	end,
}
