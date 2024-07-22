-- lazy install
local v = vim

local lazypath = v.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (v.uv or v.loop).fs_stat(lazypath) then
	v.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

v.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.keymaps")
require("config.options")
require("config.neovide")

-- 플러그인 폴더의 루아 파일들을 모두 가져옴
local plugins = "plugins"
local opts = {}

require("lazy").setup(plugins, opts)
