local Index = require("spare.utils.index")
local builtin = require("spare.utils.builtin")
-- local echo = function(str)
--   vim.cmd("redraw")
--   vim.api.nvim_echo({ { str, "Bold" } }, true, {})
-- end

---@class SpareConfig: SpareOptions
local M = {}

---@class SpareOptions
local defaults = {
  options = {
    mode = nil,
    enabled = false,
    -- import = "spare.utils.tables.options",
    --- @type table
    set = Index.options,
    --- @type table
  },
  keymaps = {
    mode = nil,
    enabled = false,
    --- @type table
    set = Index.keymaps,
    -- { mode = "n", keys = "<c-c>", exec = "<cmd>wq<cr>" },
    -- n = {},
    -- v = {},
  },
  autocmds = {
    mode = nil,
    enabled = false,
    --- @type boolean?
    lastplace = false,
    --- @type boolean?
    directory = false,
    --- @type boolean?
    based_term_support = false,
    set = {},
  },
  health = {
    check = {
      basic = true,
      lsp = true,
    },
  },
  features = {
    --- @type boolean?
    lastplace = true,
    --- @type boolean?
    directory = false,
    --- @type boolean?
    based_term_support = true,
  },
  colorscheme = "catppuccin",
  lsp = {
    server = {
      lua_ls = {},
    },
    ensure_installed = {},
    icons = true,
    default_attach_keymaps = true,
    diagnostics = {
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        focused = true,
        source = "always",
        border = "rounded",
      },
    },
  },
}

function M.setup(opts)
  Cfg = vim.tbl_deep_extend("force", defaults, opts or {}) or {}
  local sfc = {
    opts = "config.options",
    keymaps = "config.keymaps"
  }
  if Cfg.options then
    if Cfg.options.enabled then
      if Cfg.options.mode == "single-file" then
        local ok = pcall(require, sfc.opts)
        if ok then
          options = require(sfc.opts)
        end
        if
            type(options) == "table" and not nil
        then
          builtin.options(options)
        else
          pcall(require(options))
        end
      else
        builtin.options(Cfg.options.set)
      end
    end
    if Cfg.keymaps then
      if Cfg.keymaps.enabled then
        if Cfg.keymaps.mode == 'single-file' then
          local ok = pcall(require, sfc.keymaps)
          if ok then
            keymaps = require(sfc.keymaps)
          end
          if
              type(keymaps) == "table" and not nil
          then
            builtin.keymaps(keymaps)
          else
            pcall(require(keymaps))
          end
        end
      else
        builtin.keymaps(Cfg.keymaps.set)
      end
    end
    if Cfg.autocmds then
      if Cfg.autocmds.enabled then
        if Cfg.autocmds.lastplace then
          builtin.notify("This options are deprated, you should use `features.lastplace` instead.", "INFO")
        end
        if Cfg.autocmds.directory then
          builtin.notify("This options are deprated, you should use `features.directory` instead.", "INFO")
        end
        if Cfg.autocmds.based_term_support then
          builtin.notify("This options are deprated, you should use `features.based_term_support` instead.", "INFO")
        end
        if Cfg.autocmds.mode == "single-file" then
          return
        else
          if type(Cfg.autocmds.set) == "table" then
            for events, keys in pairs(Cfg.autocmds.set) do
              vim.api.nvim_create_autocmd(events, keys)
            end
          end
        end
      end
    end
  end
  if type(Cfg.features) == "table" then
    if Cfg.features.lastplace then
      Index.lastplace()
    end
    if Cfg.features.directory then
      Index.directory()
    end
    if Cfg.features.based_term_support then
      Index.terminal()
    end
  end
  if type(Cfg.modules) == "table" then
    for _, module in ipairs(Cfg.modules) do
      local ok = pcall(require, module)
      if ok then
        require(module)
      end
    end
  end
  if type(Cfg.colorscheme) == "string" then
    local color = Cfg.colorscheme or "habamax"
    vim.cmd("colorscheme " .. color .. "")
  elseif type(Cfg.colorscheme) == "nil" then
    local color = "habamax"
    vim.cmd("colorscheme " .. color .. "")
  elseif type(Cfg.colorscheme) == "function" then
    ---@type function
    Cfg.plugin.colorscheme()
  end
  if type(Cfg.lsp) == "table" then
    for lsp_server, settings in pairs(Cfg.lsp.server) do
      local lspcfg = pcall(require, "lspconfig")
      if lspcfg then
        require("lspconfig")[lsp_server].setup(settings)
      end
    end
    vim.diagnostic.config(vim.deepcopy(Cfg.lsp.diagnostics))
    if Cfg.lsp.icons then
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
    if Cfg.lsp.default_attach_keymaps then
      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<leader>ed', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "lsp_finder" })
          vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
          vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
          vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
          vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "goto_definition" })
          vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
          vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
          vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
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
          vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
    vim.keymap.set("n", "<leader>t", function()
      require("spare.utils.views"):setup_view()
    end)
  elseif not Cfg.lsp then
    return
  end
  return Cfg
end

setmetatable(M, {
  __index = function(_, key)
    if Cfg == nil then
      return vim.deepcopy(defaults)[key]
    end
    if Mgr == nil then
      return vim.deepcopy(defaults)[key]
    end
    return Cfg[key]
  end
})

return M
