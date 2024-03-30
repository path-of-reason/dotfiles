local home = os.getenv('HOME')
local jdtls = require('jdtls')
local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_mac'
local plugins_dir = jdtls_dir .. '/plugins/'
local path_to_jar = plugins_dir .. 'org.eclipse.equinox.launcher_*.jar'
local java_dir = '/opt/homebrew/Cellar/openjdk/20.0.1'
-- local java_dir = '/Users/wistaria/.asdf/installs/java/temurin-17.0.8+7/bin/'
local root_markers = { 'gradlew', 'mvnw', 'pom.xml', "build.gradle"}
local root_dir = require('jdtls.setup').find_root(root_markers)

-- 자바프로젝트가 아니면 아래 모든 옵션 비활성화
if root_dir == nil then
  return
end
print(jdtls_dir)
print("welcome to java in lunarvim")

-- eclipse.jdt.ls stores project specific data within a folder. If you are working
-- with multiple different projects, each project must use a dedicated data directory.
-- This variable is used to configure eclipse to use the directory name of the
-- current project found using the root_marker as the folder for project specific data.
-- 왜 여기 두는지 아직 모르겟음
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- 키맵 도와주는 함수
-- function nnoremap(rhs, lhs, bufopts, desc)
--   bufopts.desc = desc
--   vim.keymap.set("n", rhs, lhs, bufopts)
-- end

-- -- The on_attach function is used to set key maps after the language server
-- -- attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Regular Neovim LSP client keymappings
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
--   nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
--   nnoremap('gi', vim.lsp.buf.implementation, bufopts, "Go to implementation")
--   nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
--   nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts, "Show signature")
--   nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
--   nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
--   nnoremap('<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts, "List workspace folders")
--   nnoremap('<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
--   nnoremap('<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
--   nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts, "Code actions")
--   vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
--     { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
--   nnoremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")

--   -- Java extensions provided by jdtls
--   nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
--   nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
--   nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
--   vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
--     { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
-- end

local config = {
  flags = {
    debounce_text_changes = 80,
  },

  -- on_attach = on_attach, -- keybindings 
  root_dir = root_dir, -- Set the root directory to our found root_marker

  settings = {
    java = {
      home= java_dir,
      eclipse = {
        downloadSources = true
      },
      format = {
        enabled = true,
        settings = {
          -- 자바 구글 스타일 다운받아서 넣음
          url = "/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*", "sun.*",
        },
      },
      -- Specify any options for organizing imports
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- How code generation should act
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
               {
            name = "termin17",
            path = java_dir
          },
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
    }
  },
  cmd = {
    -- jdk 경로
    java_dir .. '/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- 롬복 경로 : 메이슨이 다운로드 해준곳
    '-javaagent:', '~/.local/share/lvim/mason/packages/jdtls/lombok.jar',

    -- 이건 브류로 다운로드한 jdtls경로
    '-jar', path_to_jar,
    '-configuration', config_dir,
    '-data', workspace_folder,
  },
}

-- Finally, start jdtls. This will run the language server using the configuration we specified,
-- setup the keymappings, and attach the LSP client to the current buffer
jdtls.start_or_attach(config)
