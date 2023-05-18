-- Setup language servers.
-- local lspconfig = require('lspconfig')
-- lspconfig.lua_ls.setup {}
-- lspconfig.bashls.setup {}
-- lspconfig.pylsp.setup {}
-- -- lspconfig.pyright.setup {}
-- lspconfig.quick_lint_js.setup {}
-- lspconfig.jdtls.setup {}
-- lspconfig.gopls.setup {}
-- lspconfig.golangci_lint_ls.setup{}
-- -- WARN:Please on command line to input 'clangd' to check it can successfully run.
-- -- Easy to check:clang version>=11
-- lspconfig.clangd.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set("n", "<c-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
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
    local keymap = vim.keymap.set
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
    keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
    keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
    keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
    keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
    keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
    keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  -- virtual_text = true,
  -- signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local on_references = vim.lsp.handlers["textDocument/references"]
vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
  on_references, {
    -- Use location list instead of quickfix list
    loclist = true,
  }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(namespace, bufnr)
      return vim.b[bufnr].show_signs == true
    end,
    -- Disable a feature
    update_in_insert = true,
  }
)
