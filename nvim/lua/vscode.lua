if vim.g.vscode then
  print('hello vscode neovim')
  local map = require("utils").map
  -- map(",<Space>", ":nohlsearch<CR>", { silent = true })
  -- map("<Leader>e", "workbench.view.explorer", { silent = true })
  -- map("<Leader>?", ":WhichKey ','<CR>")
  -- map("<Leader>a", ":cclose<CR>")
end
