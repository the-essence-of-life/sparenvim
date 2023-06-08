local cmp = require('cmp')
local lspkind = require('lspkind')

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  -- As currently, i am not using any snippet manager, thus disabled it.
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = false,
      menu = {
        buffer   = "(BUF)",
        nvim_lsp = "(LSP)",
        path     = "(PATH)",
        buffer_lines = '(BUFL)',
      },
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = 'luasnip' },
    { name = "buffer",  keyword_length = 5 },
    sources = {
      {
        name = "buffer-lines",
        option = {
          words = true,
          comments = true,
        }
      }
    },
  },
  experimental = {
    -- ghost_text = true
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')["bashls"].setup {
  capabilities = capabilities
}
require('lspconfig')["lua_ls"].setup {
  capabilities = capabilities
}
require('lspconfig')["html"].setup {
  capabilities = capabilities
}
require('lspconfig')["tsserver"].setup {
  capabilities = capabilities
}

require('lspconfig')["cssls"].setup {
  capabilities = capabilities
}
require('lspconfig')["volar"].setup {
  capabilities = capabilities
}
require('lspconfig')["eslint"].setup {
  capabilities = capabilities
}
