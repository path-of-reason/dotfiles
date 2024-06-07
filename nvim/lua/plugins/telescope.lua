local map = require("utils.keyMapper").map

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require "telescope.builtin"
      map("<leader>f", builtin.find_files) --file search
      map("<leader>t", builtin.live_grep) -- text search
      map("<leader>hf", builtin.help_tags) -- help function
      map("<leader>hk", builtin.keymaps) -- help keymap
      map("<leader>hb", builtin.buffers) -- help buffer
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
