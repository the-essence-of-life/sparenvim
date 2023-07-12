require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(bash_language_server)        -- default handler (optional)
    require("lspconfig")[bash_language_server].setup {}
  end,
  function(vtsls)        -- default handler (optional)
    require("lspconfig")[vtsls].setup {}
  end,
  function(rome)        -- default handler (optional)
    require("lspconfig")[rome].setup {}
  end,
  function(css_lsp)        -- default handler (optional)
    require("lspconfig")[css_lsp].setup {}
  end,
  function(html_lsp)        -- default handler (optional)
    require("lspconfig")[html_lsp].setup {}
  end,
}
