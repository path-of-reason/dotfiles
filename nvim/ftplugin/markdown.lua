-- 파일 경로: ~/.config/nvim/ftplugin/markdown.lua

-- 1. 줄 바꿈(Wrap) 설정
-- options.lua에서 비활성화(false)된 wrap을 마크다운에서만 활성화합니다.
vim.opt_local.wrap = true

-- 2. 단어 단위 줄 바꿈 (Linebreak)
-- 문장이 길어질 때 단어 중간이 끊기지 않고 공백 기준으로 다음 줄로 넘어갑니다.
vim.opt_local.linebreak = true

-- 3. 줄 바꿈 시 들여쓰기 유지 (Breakindent)
-- 줄 바꿈된 텍스트가 시작 지점과 동일한 들여쓰기를 유지하여 가독성을 높입니다.
vim.opt_local.breakindent = true

-- 4. 마크다운 가독성 관련 보조 설정
-- 이미 options.lua에 있지만, 이 버퍼에서 확실히 동작하도록 명시합니다.
vim.opt_local.conceallevel = 2 -- 마크다운 기호를 숨기고 서식만 보여줌
vim.opt_local.spell = false -- 간단한 스펠링 체크 활성화 (선택 사항)

-- 볼드 색상처리
vim.api.nvim_set_hl(0, "MarkupBold", { bold = true, fg = "#EBCB8B" })
vim.api.nvim_set_hl(0, "@markup.strong", { bold = true, fg = "#EBCB8B" })
-- 헤딩은 마크다운 플러그인이 처리하고 있음

-- 이탤릭 (기울임) - 초록색 계열
vim.api.nvim_set_hl(0, "MarkupItalic", { italic = true, fg = "#A3BE8C" })
vim.api.nvim_set_hl(0, "@markup.italic", { italic = true, fg = "#A3BE8C" })

-- 5. Neovide 전용 설정 (GUI 환경일 때만 작동)
-- 터미널 사용자에게는 영향을 주지 않고 Neovide 사용 시에만 폰트를 바꿉니다.
if vim.g.neovide then
	vim.g.neovide_font = "NanumGothic:h16"
	vim.g.neovide_line_height = 1.5
end
