local map = require("utils.keyMapper").map
--map(from, to, mode, opts)

map("<Leader>e", ":Neotree toggle<CR>", "n")
map("<Leader><Tab>", ":Neotree buffers toggle<CR>", "n")

map("<Leader>w", ":w<CR>")
map("<Leader>1", ":q<CR>")
map("<Leader>q", ":bd<CR>")
-- map("yy", '"+y', "v")

-- terminal
map("<C-\\>", ":ToggleTerm<CR>a")
map("<C-\\>", "<Esc>:ToggleTerm<CR>a", "v")
map("<C-\\>", "<Esc>:ToggleTerm<CR>a", "i")
map("<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", "t")
map("<C-q>", "<C-\\><C-n>", "t")
map("<leader>tf", ":ToggleTerm direction=float<CR>a")
map("<leader>tv", ":ToggleTerm direction=horizontal<CR>a")
map("<leader>ts", ":ToggleTerm direction=vertical<CR>a")

-- comment
-- map("<Leader>/", "gcc")
-- map("<Leader>/", "gc", "v") e

-- indent
map("<", "<gv", "v")
map(">", ">gv", "v")

-- map("<Leader>f", ":Telescope find_files<CR>", "n")
-- map("<Leader>t", ":Telescope live_grep<CR>", "n")

map("<Leader>L", ":Lazy<CR>")

-- buffer previos next
map("<Leader>b", ":bprevious<CR>")
map("<Leader>n", ":bnext<CR>")

-- pane
map("<Leader>s", ":sp<CR>")
map("<Leader>v", ":vsp<CR>")
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

-- telescope
--map("<leader>f", builtin.find_files) --file search
--map("<leader>t", builtin.live_grep) -- text search
--map("<leader>hf", builtin.help_tags) -- help function
--map("<leader>hk", builtin.keymaps) -- help keymap
--map("<leader>hb", builtin.buffers) -- help buffer
-- treesitter
map("<leader>ht", ":TSModuleInfo<CR>") -- help treesitter module info -- will remove

--- ufo
-- map('zR', ufo.openAllFolds)
-- map('zM', ufo.closeAllFolds)
-- map('za', ufo.toggleFold)
