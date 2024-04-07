local M = {}

M.section_author = {
  type = "text",
  val = {
    [[ Author:the-essence-of-life]],
    -- [[]],
    -- [[]],
    -- [[]],
    -- [[]],
    -- [[]],
  },
  opts = {
    position = "left",
    hl = "CurSearch",
    -- hl = "Search",
  },
}

M.section_comment = {
  type = "text",
  val = {
    -- [[]],
    -- [[]],
    [[]],
    [[]],
    [[]],
    [[]],
  },
}

M.section_header = {
  type = "text",
  val = {
    [[    _________  ____ _________  ]],
    [[   / ___/ __ \/ __ `/ ___/ _ \ ]],
    [[  (__  ) /_/ / /_/ / /  /  __/ ]],
    [[ /____/ .___/\__,_/_/   \___/  ]],
    [[     /_/                       ]],
  },
  opts = {
    position = "center",
    hl = "LineNr",
    -- hl = "Search",
  },
}

function M.buttons()
  local keybind_opts = { silent = true, noremap = true }
  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function(_)
      local buf_keys = vim.api.nvim_buf_set_keymap
      buf_keys(0, "n", "n", "<cmd>e Empty<CR>", keybind_opts)
      buf_keys(0, "n", "s", "<cmd>Lazy sync<CR>", keybind_opts)
      buf_keys(0, "n", "l", "<cmd>Lazy<CR>", keybind_opts)
      buf_keys(0, "n", "u", "<cmd>Lazy clean<CR>", keybind_opts)
      buf_keys(0, "n", "q", "<cmd>q<CR>", keybind_opts)
      buf_keys(0, "n", "p", "<cmd>e ~/.config/nvim/lua/core/config.lua<CR>", keybind_opts)
    end,
  })

  local buttons_hl = {
    { "Keyword", 4,  15 },
    { "LineNr",  22, 25 },
    { "Keyword", 30, 41 },
  }
  return {
    {
      type = "text",
      val = {
        "  New file      n  │    Lazy UI       l",
        "  Profile       p  │    Sync          s",
        "→  Exit          q  │    Uninstall     u",
      },
      opts = {
        position = "center",
        hl = {
          buttons_hl,
          buttons_hl,
          buttons_hl,
        },
      },
    },
  }
end

M.section_buttons = { type = "group", val = M.buttons }

function M.info_text()
  ---@diagnostic disable-next-line:undefined-field
  local datetime = os.date(" %A, %d %B %Y")
  local lazy_stats = require("lazy").stats()
  local ms = (math.floor(lazy_stats.startuptime * 100 + 0.5) / 100)
  local version = vim.version()
  local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "LazyVimStarted" },
    callback = function()
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
  return datetime .. nvim_version_info
end

M.section_info = {
  type = "text",
  val = function()
    return M.info_text()
  end,
  opts = {
    hl = "AlphaInfo",
    position = "center",
  },
}

vim.b.miniindentscope_disable = true

-- close Lazy and re-open when the dashboard is ready
if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      print("alpha ready")
      -- require("lazy").show()
    end,
  })
end

M.config = {
  layout = {
    M.section_author,
    M.section_comment,
    M.section_header,
    { type = "padding", val = 1 },
    { type = "padding", val = 1 },
    M.section_buttons,
    { type = "padding", val = 1 },
    M.section_info,
  },
}

return M
