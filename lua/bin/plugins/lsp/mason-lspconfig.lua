require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  github = {
    download_url_template = "https://ay1.us/https://github.com/%s/releases/download/%s/%s",
  },
})

local lspconfig = require('lspconfig')
local handlers = {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["lua_ls"] = function ()
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
  ["bashls"] = function ()
    lspconfig.bashls.setup {}
  end,
  ["tsserver"] = function ()
    lspconfig.tsserver.setup{}
  end,
  -- ["html"] = function ()
    --   lspconfig.html.setup {}
    -- end,
  }

  require("mason-lspconfig").setup_handlers(handlers)
  require("mason-lspconfig").setup({
    ensure_installed = { "tsserver" }
  })
  -- require("lspconfig").setup()
