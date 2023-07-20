-- require("noice.source.notify").setup{}
require("notify").setup({
  -- render = {
  render = "minimal",
  -- }
})

require("noice").setup({
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,       -- use a classic bottom cmdline for search
    command_palette = true,     -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,         -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,     -- add a border to hover docs and signature help
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
            winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
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
