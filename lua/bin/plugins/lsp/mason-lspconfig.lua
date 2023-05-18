require("mason").setup()
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
-- WARN:Please on command line to input 'clangd' to check it can successfully run.
-- Easy to check:clang version>=11
-- lspconfig.clangd.setup {}

require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
  -- ["lua_ls"] = function()
  --   lspconfig.lua_ls.setup {}
  -- end,
  ["bashls"] = function()
    lspconfig.bashls.setup {
      filetypes = 'sh',
    }
  end,
  ["pyright"] = function()
    lspconfig.pyright.setup {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
          }
        }
      },
      filetypes = 'python',
    }
  end,
  -- ["pylsp"] = function()
  --   lspconfig.pylsp.setup {
  --     settings = {
  --       pylsp = {
  --         plugins = {
  --           pycodestyle = {
  --             ignore = { 'W391' },
  --             maxLineLength = 100
  --           }
  --         }
  --       }
  --     }
  --   }
  -- end,
  -- ["jdtls"] = function()
  --   lspconfig.jdtls.setup {
  --     cmd = { 'jdtls' }
  --   }
  -- end,
  ["clangd"] = function()
    require("clangd_extensions").setup {
      server = {
        -- options to pass to nvim-lspconfig
        require("lspconfig").clangd.setup {}
      },
      extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
          -- Only show inlay hints for the current line
          only_current_line = false,
          -- Event which triggers a refersh of the inlay hints.
          -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
          -- not that this may cause  higher CPU usage.
          -- This option is only respected when only_current_line and
          -- autoSetHints both are true.
          only_current_line_autocmd = "CursorHold",
          -- whether to show parameter hints with the inlay hints or not
          show_parameter_hints = true,
          -- prefix for parameter hints
          parameter_hints_prefix = "<- ",
          -- prefix for all the other hints (type, chaining)
          other_hints_prefix = "=> ",
          -- whether to align to the length of the longest line in the file
          max_len_align = false,
          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,
          -- whether to align to the extreme right or not
          right_align = false,
          -- padding from the right if right_align is true
          right_align_padding = 7,
          -- The color of the hints
          highlight = "Comment",
          -- The highlight group priority for extmark
          priority = 100,
        },
        ast = {
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },

          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },

          highlights = {
            detail = "Comment",
          },
        },
        memory_usage = {
          border = "none",
        },
        symbol_info = {
          border = "rounded",
        },
      },
    }
  end,
  ["gopls"] = function()
    lspconfig.gopls.setup {}
  end,
  ["golangci_lint_ls"] = function()
    lspconfig.golangci_lint_ls.setup {}
  end,
}
