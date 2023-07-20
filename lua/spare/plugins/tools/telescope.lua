require("telescope").setup({
  defaults = {
    mappings = {
      i = {},
    },
  },
  pickers = {},
  extensions = {
    -- file_browser = {
    --   theme = "ivy",
    --   display_stat = { date = true, size = true, mode = false },
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    --   mappings = {
    --     ["i"] = {
    --       -- your custom insert mode mappings
    --     },
    --     ["n"] = {
    --       -- your custom normal mode mappings
    --     },
    --   },
    -- },
    -- frecency = {
    --   db_root = "~/",
    --   show_scores = false,
    --   show_unindexed = true,
    --   ignore_patterns = { "*.git/*", "*/tmp/*" },
    --   disable_devicons = false,
    --   workspaces = {
    --     ["conf"] = "~/.config/",
    --     ["data"] = "~/.local/share/",
    --     -- ["project"] = "~/workspace/",
    --   },
    -- },
    menu = {
      default = {
        items = {
          { "󱠀  Editor",                      "Telescope menu editor" },
          -- You can add an item of menu in the form of { "<display>", "<command>" }
          { "  Checkhealth",                  "checkhealth" },
          { "  Show LSP Info",                "LspInfo" },
          { "  Files",                        "Telescope find_files" },
          { "󰗼  Exit",                        "wqa!" },

          -- The above examples are syntax-sugars of the following;
          { display = "  Change colorscheme", value = "Telescope colorscheme" },
        },
      },
      editor = {
        items = {
          { " Split window vertically",   "vsplit" },
          { " Split window horizontally", "split" },
          { "󰙏 Write",                    "w" },
          { " Filetype Options",          "Telescope menu filetype" },
        },
      },
      filetype = {
        lua = {
          items = {
            { "󰉶 Format",                   "!stylua %" },
            -- { "Open Luadev menu", "Luadev" },
            { "󰶭 Execute a current buffer", "LuaRun" },
          },
        },
        sh = {
          items = {
            { " Run Terminal", "ToggleTerm" },
          },
        },
      },
    },
  },
})
