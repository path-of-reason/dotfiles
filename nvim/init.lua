-- require "keymap"
require "config"
require "vscode"

local map = require("utils").map
vim.g.mapleader = " "
--map("n", "<Leader>e", ":E<CR>")
map("n", "<Leader>e", ":Neotree<CR>")
map("n", "<Leader>w", ":w<CR>")
map("n", "<Leader>q", ":q<CR>")
map("n", "<Leader>L", ":Lazy<CR>")
