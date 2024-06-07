-- local lvimPath = '~/.config/lvim/?.lua'
-- package.path = lvimPath .. package.path
require("emmet-ls")
require("plugins")
require("neovide")
-- require example
-- require 'custom'
-- require 'other.print-hello'
-- require('jdtl')

-- https://github.com/sambergo/lunarvim-snippet-examples
require("luasnip/loaders/from_vscode").load({
  paths = { "~/.config/lvim/snippets/vscode-es7-javascript-react-snippets" },
})
require("luasnip/loaders/from_vscode").load({ paths = { "~/.config/lvim/snippets/my-snippets" } })
-- lvim.builtin.lualine.options.theme = "gruvbox_dark"
-- lvim.builtin.lualine.style = "default" -- or "none"
lvim.format_on_save.enabled = true
