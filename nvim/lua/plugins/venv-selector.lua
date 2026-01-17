return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python", -- 디버깅용 (선택사항이지만 있으면 좋음)
	},
	branch = "regexp", -- 성능이 더 좋은 최신 브랜치 사용 권장
	config = function()
		require("venv-selector").setup({
			settings = {
				options = {
					notify_user_on_venv_activation = true, -- 활성화시 알림
				},
			},
		})
	end,
	keys = {
		-- 단축키: <leader>v 를 누르면 가상환경 선택창이 뜹니다.
		{ "<leader>v", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
	},
}
