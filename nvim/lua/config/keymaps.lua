local map = require("utils.keyMapper").map
local v = vim
--map(from, to, mode="n", opts)

map("<Leader>e", ":Neotree toggle<CR>", "n")
map("<Leader><Tab>", ":Neotree buffers toggle<CR>", "n")

map("<Leader>w", ":w<CR>")
map("<Leader>1", ":q<CR>")
map("<Leader>q", ":bd<CR>")
-- for nvim function dev
map("<Leader>pt", ":InspectTree<CR>") -- parser tree
map("<Leader>pq", ":EditQuery<CR>") -- parser query
-- terminal
map("<C-\\>", ":ToggleTerm<CR>")
map("<C-\\>", "<Esc>:ToggleTerm<CR>", "v")
map("<C-\\>", "<Esc>:ToggleTerm<CR>", "i")
map("<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", "t")
map("<C-q>", "<C-\\><C-n>", "t")
map("<leader>tf", ":ToggleTerm direction=float<CR>")
map("<leader>tv", ":ToggleTerm direction=horizontal<CR>")
map("<leader>ts", ":ToggleTerm direction=vertical<CR>")
-- theme
map("<leader>t1", ":colorscheme solarized<CR>")
map("<leader>t2", ":colorscheme lackluster-hack<CR>")

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
