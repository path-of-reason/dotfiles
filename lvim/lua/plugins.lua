lvim.plugins = {
  -- {
  --   "neoclide/coc.nvim",
  --   branch = "release",
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "excalivault",
          path = "~/Documents/obsidian/excalivault/excalivault/",
        },
        {
          name = "no-vault",
          path = function()
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
          end,
          overrides = {
            notes_subdir = vim.NIL,
            new_notes_location = "current_dir",
            templates = { subdir = vim.NIL },
            disable_frontmatter = true,
          }
        }
      },
      mappings = {
        ["gd"] = { -- open link note
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ch"] = { -- toggle_checkbox
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = "untitled" .. string.char(math.random(65, 90))
          end
        end
        return suffix
      end,
    },
  },
  --rescript
  { 'rescript-lang/vim-rescript', ft = "rescript" },
  -- for clojure evaluation
  'Olical/conjure',
  'radenling/vim-dispatch-neovim',
  -- custom snippets
  -- 'SirVer/ultisnips',
  -- for java
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-jdtls',
  'nvim-lua/plenary.nvim',
  -- git viewer
  'rbong/vim-flog',
  { 'tpope/vim-fugitive' },
  -- for theme
  { "xiyaowong/transparent.nvim" },
  -- surround etc
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
}
