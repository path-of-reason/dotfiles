-- lazy install
local v = vim

-- Bootstrap lazy.nvim
local lazypath = v.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (v.uv or v.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = v.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if v.v.shell_error ~= 0 then
		v.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		v.fn.getchar()
		os.exit(1)
	end
end

v.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.keymaps")
require("config.neovide")
require("config.iabbr")
require("config.options")

-- luarocks
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

-- 플러그인 폴더의 루아 파일들을 모두 가져옴
local plugins = "plugins"
local opts = {
	rocks = {
		hererocks = false, -- recommended if you do not have global installation of Lua 5.1.
		enabled = false,
	},
}

require("lazy").setup(plugins, opts)
