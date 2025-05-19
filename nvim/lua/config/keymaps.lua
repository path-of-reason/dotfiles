local map = require("utils.keyMapper").map
local v = vim
--map(from, to, mode="n", opts)
-- for nvim function dev
-- indent
map("<", "<gv", "v")
map(">", ">gv", "v")

-- map("<Leader>f", ":Telescope find_files<CR>", "n")
-- map("<Leader>t", ":Telescope live_grep<CR>", "n")

map("<Leader>L", ":Lazy<CR>")
map("<Leader>M", ":Mason<CR>")

-- buffer previos next
map("<Leader>b", ":bprevious<CR>")
map("<Leader>n", ":bnext<CR>")

-- pane size
map("<C-S-j>", "<C-w>-")
map("<C-S-k>", "<C-w>+")
map("<C-S-h>", "<C-w><")
map("<C-S-l>", "<C-w>>")
-- pane move
map("<C-h>", "<C-w>h")
map("<C-j>", "<C-w>j")
map("<C-k>", "<C-w>k")
map("<C-l>", "<C-w>l")

-- remove highlight
map("<Leader>/", ":nohlsearch<CR>")

-- treesitter
map("<leader>ht", ":TSModuleInfo<CR>") -- help treesitter module info -- will remove

--- ufo
-- map('zR', ufo.openAllFolds)
-- map('zM', ufo.closeAllFolds)
