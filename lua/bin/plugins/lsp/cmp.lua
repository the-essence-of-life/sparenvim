local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
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
    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Down
    -- ["<CR>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
    -- format = lspkind.cmp_format {
    --   with_text = false,
    --   menu = {
    --     buffer   = "(BUF)",
    --     nvim_lsp = "(LSP)",
    --     path     = "(PATH)",
    --     buffer_lines = '(BUFL)',
    --   },
    -- },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    -- { name = 'fuzzy_path'},
    { name = "luasnip" },
    { name = 'nvim_lua' },
    { name = "buffer",  keyword_length = 5 },
    -- sources = {
    -- {
    --   name = "buffer-lines",
    --   keyword_length = 5,
    --   option = {
    --     words = true,
    --     -- comments = true,
    --   },
    -- },
    -- },
  },
  experimental = {
    ghost_text = true,
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})
