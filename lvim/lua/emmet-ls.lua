-- it need emmet-ls
-- npm install -g emmet-ls
-- for react dom tag snippetSupport

local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "rs", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust_analyzer"] = {
      proMacro = {
        ignored = {
          leptos_macro = {
            "server",
          }
        }
      }
    }
  }
})
lspconfig.rescriptls.setup {}
