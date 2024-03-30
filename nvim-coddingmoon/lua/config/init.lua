-- 레이지 빔 있는지 확인
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- 없으면 설치
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")
-- 플러그인에 있는것들 셋업하기
require("lazy").setup("plugins")

