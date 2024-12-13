local v = vim

local function getCurrentPath()
	return v.fn.expand("%:p")
end
local function getProjectPath()
	return v.fn.getcwd()
end

local function getFileExtension(filepath)
	return filepath:match("^.+(%..+)$")
end

function RunFile()
	local currentFile = getCurrentPath()
	local fileExtension = getFileExtension(currentFile)

	local cmd

	if fileExtension == ".py" then
		cmd = string.format('python "%s"', currentFile)
	elseif fileExtension == ".js" or fileExtension == ".ts" then
		cmd = string.format('bun run "%s"', currentFile)
	elseif fileExtension == ".rs" then
		cmd = string.format("cargo run")
	else
		print("Unsupported file type: " .. fileExtension)
		return
	end
	-- 명령어 실행
	v.cmd(string.format("!%s", cmd))
end

function Venv_activate()
	local current_dir = getProjectPath()
	local current_activator = current_dir .. ".venv/bin/activate"
	local cmd = string.format("source %s", current_activator)
	v.cmd(string.format("!%s", cmd))
end

function Venv_deactivate()
	local cmd = "deactivate"
	v.cmd(cmd)
end

function EchoCurrentPath()
	local currentFile = getCurrentPath()
	local cmd = string.format('echo "%s"', currentFile)
	v.cmd(string.format("!%s", cmd))
end

function ToggleInlayHint()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end
