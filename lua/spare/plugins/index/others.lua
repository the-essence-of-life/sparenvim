local M = {}

M.trouble = {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = " ", -- icon used for open folds
  fold_closed = " ", -- icon used for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    close = "q",                     -- close the list
    cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
    refresh = "r",                   -- manually refresh
    jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
    open_split = { "<c-x>" },        -- open buffer in new split
    open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
    open_tab = { "<c-t>" },          -- open buffer in new tab
    jump_close = { "o" },            -- jump to the diagnostic and close the list
    toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = "P",            -- toggle auto_preview
    hover = "K",                     -- opens a small popup with the full multiline message
    preview = "p",                   -- preview the diagnostic location
    close_folds = { "zM", "zm" },    -- close all folds
    open_folds = { "zR", "zr" },     -- open all folds
    toggle_fold = { "zA", "za" },    -- toggle fold of current file
    previous = "k",                  -- previous item
    next = "j",                      -- next item
  },
  indent_lines = true,               -- add an indent guide below the fold icons
  auto_open = false,                 -- automatically open the list when you have diagnostics
  auto_close = false,                -- automatically close the list when you have no diagnostics
  auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false,                 -- automatically fold a file trouble list at creation
  auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
  -- signs = {
  --   -- icons / text used for a diagnostic
  --   error = "",
  --   warning = "",
  --   hint = "",
  --   information = " ",
  --   other = "﫠",
  -- },
  use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
}

M.noice = {
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    -- command_palette = true,     -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
    command_palette = {
      views = {
        cmdline_popup = {
          position = {
            row = 3,
            col = "50%",
          },
          size = {
            -- min_width = 60,
            width = "80%",
            height = "auto",
          },
          opts = {
            win_options = {
              -- winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder"},
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticSignWarn" },
            },
          },
        },
        cmdline_popupmenu = {
          relative = "editor",
          position = {
            row = 6,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            -- winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder"},
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticSignWarn" },
          },
        },
      },
    },
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true,              -- enables the Noice messages UI
    view = "mini",               -- default view for messages
    view_error = "mini",         -- view for errors
    view_warn = "mini",          -- view for warnings
    view_history = "messages",   -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {
      max_width = 18,
    },
  },
  notify = {
    enabled = false,
  },
  commands = {
    -- :Noice last
    last = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "split" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp",      kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    -- :Noice errors
    errors = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
  },
  lsp = {
    progress = {
      enabled = true,
    },
  },
}

M.harpoon = function()
  require("harpoon").setup({})

  vim.keymap.set("n", "<leader>nf", '<cmd>lua require("harpoon.mark").add_file()<cr>')
  vim.keymap.set("n", "<leader>la", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
  vim.keymap.set({ "n", "i", "v" }, "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
  vim.keymap.set({ "n", "i", "v" }, "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
  vim.keymap.set({ "n", "i", "v" }, "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
  vim.keymap.set({ "n", "i", "v" }, "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
  vim.keymap.set({ "n", "i", "v" }, "<leader>5", '<cmd>lua require("harpoon.ui").nav_file(5)<cr>')

  vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
  vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
  vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
  vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
  vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
end

M.treesitter = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

M.persistence = {
  dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
  options = { "buffers", "curdir", "tabpages", "winsize" },     -- sessionoptions used for saving
  pre_save = nil,                                               -- a function to call before saving the session
}

M.dressing = {
  input = {
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },
  }
}

return M
