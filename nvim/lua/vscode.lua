if vim.g.vscode then
  print('hello vscode neovim')
  local map = require("utils").map
  -- map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
  -- map("n", "<Leader>e", "workbench.view.explorer", { silent = true })
  -- map("n", "<Leader>?", ":WhichKey ','<CR>")
  -- map("n", "<Leader>a", ":cclose<CR>")
else
  -- ordinary Neovim
end
