local M = {}

M.mason = {
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
    download_url_template = "https://kkgithub.com/%s/releases/download/%s/%s",
  },
}

M.lspconfig_global = function()
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
      -- callback = function(ev, args)
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {desc = "lsp_finder"})
      vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
      vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
      vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>" , {desc = "goto_definition"})
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

M.lsp_server = function()
  local server = {
    "lua_ls",
    "bashls",
    "pyright",
    "jsonls",
    "clangd",
    "tsserver",
    "html",
    "pyre",
    "volar",
  }
  for _, server_name in ipairs(server) do
    require("lspconfig")[server_name].setup({})
  end
  local capabilities_for_css = vim.lsp.protocol.make_client_capabilities()
  capabilities_for_css.textDocument.completion.completionItem.snippetSupport = true
  require 'lspconfig'.cssls.setup {
    capabilities = capabilities_for_css,
  }
end

M.lsp_settings = function()
  vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
  local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

M.competition = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  -- local lspkind = require("lspkind")

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
      -- completion = {
      --   winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      --   col_offset = -3,
      --   side_padding = 0,
      -- },
    },
    mapping = {
      ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Up
      ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Down
      ['<C-l>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          return cmp.complete_common_string()
        end
        fallback()
      end, { 'i', 'c' }),
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
      { name = "luasnip" },
      { name = "path" },
      { name = 'nvim_lua' },
      -- { name = 'plugins' },
      -- { name = 'nerdfont' },
    },
    performance = {
      async_budget = 300,
      max_view_entries = 20,
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
  vim.cmd([[
    highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
    highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    highlight! link CmpItemKindInterface CmpItemKindVariable
    highlight! link CmpItemKindText CmpItemKindVariable
    highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    highlight! link CmpItemKindMethod CmpItemKindFunction
    highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    highlight! link CmpItemKindProperty CmpItemKindKeyword
    highlight! link CmpItemKindUnit CmpItemKindKeyword
  ]])
end

M.lspsaga = {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  request_timeout = 2000,
  finder = {
    max_height = 0.5,
    min_width = 30,
    force_max_height = false,
    keys = {
      jump_to = "p",
      expand_or_jump = "o",
      vsplit = "s",
      split = "i",
      tabe = "t",
      tabnew = "r",
      quit = { "q", "<ESC>" },
      close_in_preview = "<ESC>",
    },
  },
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = "q",
      exec = "<CR>",
    },
  },
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  hover = {
    max_width = 0.6,
    open_link = "gx",
    open_browser = "!chrome",
  },
  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    insert_winblend = 0,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    max_width = 0.7,
    max_height = 0.6,
    max_show_width = 0.9,
    max_show_height = 0.6,
    text_hl_follow = true,
    border_follow = true,
    extend_relatedInformation = false,
    keys = {
      exec_action = "o",
      quit = "q",
      expand_or_jump = "<CR>",
      quit_in_show = { "q", "<ESC>" },
    },
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    preview_width = 0.4,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    auto_resize = false,
    custom_sort = nil,
    keys = {
      expand_or_jump = "o",
      quit = "q",
    },
  },
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  beacon = {
    enable = true,
    frequency = 7,
  },
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "rounded",
    winblend = 0,
    expand = " ",
    collapse = " ",
    code_action = " ",
    incoming = "I ",
    outgoing = "O ",
    hover = " ",
    kind = {},
  },
}

M.null_ls = function()
  local null_ls = require("null-ls")
  null_ls.setup({
    sources = {
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.black,
      null_ls.builtins.code_actions.eslint_d,
      -- null_ls.builtins.code_actions.shellcheck,
      null_ls.builtins.diagnostics.shellcheck, -- shell script diagnostics
      -- null_ls.builtins.formatting.shellharden, -- shell script diagnostics
      -- null_ls.builtins.formatting.shfmt, -- shell script diagnostics
      -- null_ls.builtins.completion.luasnip,
      -- null_ls.builtins.completion.tags,
      -- null_ls.builtins.completion.spell,
    },
  })
end

return M
