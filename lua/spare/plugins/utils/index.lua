local M = {}

M.autoclose = function()
  require("autoclose").setup({
    keys = {
      ["$"] = { escape = true, close = true, pair = "$$" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },
      [")"] = { escape = true, close = false, pair = "()" },
      ["]"] = { escape = true, close = false, pair = "[]" },
      ["}"] = { escape = true, close = false, pair = "{}" },
      ['"'] = { escape = true, close = true, pair = '""' },
      ["'"] = { escape = true, close = true, pair = "''" },
      ["`"] = { escape = true, close = true, pair = "``" },
      ["("] = { escape = true, close = true, pair = "()" },
    },
    options = {
      disable_when_touch = true,
    },
  })
end

M.noice = function()
  -- require("noice.source.notify").setup{}
  require("notify").setup({
    -- render = {
    render = "simple",
    -- }
  })

  require("noice").setup({
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
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {
        max_width = 18,
      },
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    commands = {
      history = {
        -- options for the message history that you get with `:Noice`
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp",      kind = "message" },
          },
        },
      },
      -- :Noice last
      last = {
        view = "notify",
        opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
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
        view = "notify",
        opts = { enter = true, format = "details" },
        filter = { error = true },
        filter_opts = { reverse = true },
      },
    },
  })
end

M.harpoon = function()
  local status_ok, harpoon = pcall(require, "harpoon")
  if not status_ok then
    return
  end

  harpoon.setup({})

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

M.treesitter = function()
  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
end

M.persistence = function()
  require("persistence").setup {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize" },   -- sessionoptions used for saving
    pre_save = nil,                                             -- a function to call before saving the session
  }
end

return M
