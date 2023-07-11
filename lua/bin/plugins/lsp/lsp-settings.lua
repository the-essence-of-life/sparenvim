local M = {}

M.mason = function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    },

    github = {
      -- The template URL to use when downloading assets from GitHub.
      -- The placeholders are the following (in order):
      -- 1. The repository (e.g. "rust-lang/rust-analyzer")
      -- 2. The release version (e.g. "v0.3.0")
      -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
      download_url_template = "https://ay1.us/https://github.com/%s/releases/download/%s/%s",
    },
  })
end

M.lspconfig_global = function()
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
      vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
      vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
      vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
      vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
      vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
      vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
      vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
      vim.keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
      vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
      vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
      vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
      vim.keymap.set("n", "[E", function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end)
      vim.keymap.set("n", "]E", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end)
      vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
      vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
      vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
      vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
end

M.lsp_server = function()
  require("lspconfig").lua_ls.setup({
    -- settings = {
    --   Lua = {
    --     -- Disable telemetry
    --     telemetry = { enable = false },
    --     runtime = {
    --       -- Tell the language server which version of Lua you're using
    --       -- (most likely LuaJIT in the case of Neovim)
    --       version = 'LuaJIT',
    --       -- path = runtime_path,
    --     },
    --     diagnostics = {
    --       -- Get the language server to recognize the `vim` global
    --       globals = { 'vim' }
    --     },
    --     workspace = {
    --       checkThirdParty = false,
    --       library = {
    --         -- Make the server aware of Neovim runtime files
    --         vim.fn.expand('$VIMRUNTIME/lua'),
    --         vim.fn.stdpath('config') .. '/lua'
    --       }
    --     }
    --   }
    -- }
    -- root_pattern = {
    --   ".luarc.json",
    --   ".luarc.jsonc",
    --   ".luacheckrc",
    --   ".stylua.toml",
    --   "stylua.toml",
    --   "selene.toml",
    --   "selene.yml",
    --   -- ".git"
    -- },
  })
  -- require("lspconfig").lua_ls.setup({})
  -- require("lspconfig").bashls.setup({})
  -- require 'lspconfig'.ruby_ls.setup {}
  -- require 'lspconfig'.vtsls.setup {}
  -- require("lspconfig").custom_elements_ls.setup{}
  -- require("lspconfig").ccls.setup {
  --   init_options = {
  --     compilationDatabaseDirectory = "build",
  --     index = {
  --       threads = 0,
  --     },
  --     clang = {
  --       excludeArgs = { "-frounding-math" },
  --     },
  --   }
  -- }
  -- require 'lspconfig'.rome.setup {}
end

M.lsp_settings = function()
end

return M
