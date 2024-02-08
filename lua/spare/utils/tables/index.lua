local M = {}

M.options = {
  autowrite = true,           -- Enable auto write
  clipboard = "unnamedplus",  -- Sync with system clipboard
  completeopt = "menu,menuone,noselect",
  conceallevel = 3,           -- Hide * markup for bold and italic
  confirm = true,             -- Confirm to save changes before exiting modified buffer
  cursorline = true,          -- Enable highlighting of the current line
  expandtab = true,           -- Use spaces instead of tabs
  formatoptions = "jcroqlnt", -- tcqj
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  ignorecase = true,      -- Ignore case
  inccommand = "nosplit", -- preview incremental substitute
  -- laststatus = 2,
  list = true,            -- Show some invisible characters (tabs...
  mouse = "a",            -- Enable mouse mode
  number = true,          -- Print line number
  pumblend = 10,          -- Popup blend
  relativenumber = true,  -- Relative line numbers
  scrolloff = 4,          -- Lines of context
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
  shiftround = true,      -- Round indent
  shiftwidth = 2,         -- Size of an indent
  -- shortmess:append({ W = true, I = true, c = true }),
  showmode = false,       -- Dont show mode since we have a statusline
  sidescrolloff = 8,      -- Columns of context
  signcolumn = "yes",     -- Always show the signcolumn, otherwise it would shift the text each time
  smartcase = true,       -- Don't ignore case with capitals
  smartindent = true,     -- Insert indents automatically
  spelllang = { "en" },
  splitbelow = true,      -- Put new windows below current
  splitright = true,      -- Put new windows right of current
  tabstop = 2,            -- Number of spaces tabs count for
  termguicolors = true,   -- True color support
  timeoutlen = 300,
  undofile = true,
  undolevels = 10000,
  swapfile = false,
  wildmode = "longest:full,full", -- Command-line completion mode
  winminwidth = 5,                -- Minimum window width
  wrap = false,                   -- Disable line wrap
}

M.keymaps = {
  { "n", "<leader>ex", "<cmd>wq<cr>" },
  { "n", "<leader>pm", function()
    vim.ui.input({ prompt = 'Enter for your manage command: ' }, function(input)
      vim.cmd("Lazy " .. input)
    end)
  end },
  { "n", "<leader>H",  "<cmd>bprevious<cr>" },
  { "n", "<leader>L",  "<cmd>bnext<cr>" },
  { "n", "<leader>di", function()
    vim.diagnostic.config({
      update_in_insert = true
    })
  end },
  { "n", "<leader>dn", function()
    vim.diagnostic.config({
      virtual_text = {
        -- prefix = '●',
        prefix = '',
        spacing = 2,
        format = function(diagnostic)
          local icons = {
            ERROR = "󰅚 ",
            WARN = "󰀪 ",
            HINT = "󰌶 ",
            INFO = " ",
          }
          for level, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[level] then
              -- return string.format("Error: %s", diagnostic.message)
              return string.format(icon .. "%s", diagnostic.message)
            end
          end
          return diagnostic.message
        end,
      }
    })
  end },
  { "n", "<c-a>", "ggVG" },
  { "n", "<leader>sv", "<c-w>v" },
  { "n", "<leader>sh", "<c-w>s" },
  { "n", "<leader>sx", "<c-w>c" },
  { "n", "<leader>wh", "<c-w>H" },
  { "n", "<leader>wj", "<c-w>J" },
  { "n", "<leader>wk", "<c-w>K" },
  { "n", "<leader>wl", "<c-w>L" },
}

M.autocmds = {
  -- {
  --   event = "User",
  --   pattern = "*",
  --   callback = function()
  --     vim.fn.system("echo", "hello")
  --   end
  -- },
}

M.pm_bootstraping = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    echo(" Installing the lazy.nvim to ~/.local/share/nvim/lazy/lazy.nvim...")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

M.deployment_lazy = function()
  require("lazy").setup({
    spec = {
      { import = "spare.plugins" },
    },
    git = {
      url_format = "https://github.com/%s.git",
    },
    install = {
      colorscheme = {
        "github_dark",
        "catppuccin",
        "material",
        "tokyonight",
      },
    },
    ui = {
      border = "rounded",
    },
    checker = {
      -- automatically check for plugin updates
      enabled = false,
      concurrency = 1,  --[email protected] number? set to 1 to check for updates very slowly
      notify = false,   -- get a notification when new updates are found
      frequency = 3600, -- check for updates every hour
    },
    profiling = {
      -- Enables extra stats on the debug tab related to the loader cache.
      -- Additionally gathers stats about all package.loaders
      loader = true,
      -- Track each new require in the Lazy profiling tab
      require = false,
    },
    change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      notify = false, -- get a notification when changes are found
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "netrwPlugin"
        }
      }
    },
  })
end

M.directory = function()
  -- WARN:this code search for internet.
  vim.api.nvim_create_user_command("MakeDirectory", function()
    ---@diagnostic disable-next-line: missing-parameter
    local path = vim.fn.expand("%")
    local dir = vim.fn.fnamemodify(path, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    else
      vim.notify("Directory already exists", "WARN", { title = " Directory Exists" })
    end
  end, { desc = "Create directory if it doesn't exist" })
end

M.lastplace = function()
  -- WARN:this code search for internet.
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
      if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
        vim.fn.setpos(".", vim.fn.getpos("'\""))
        vim.cmd("silent! foldopen")
      end
    end,
  })
end

M.terminal = function()
  vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
      vim.cmd("normal i")
      vim.keymap.set('t', '<c-u>', function()
        vim.cmd("res +2")
      end)
      vim.keymap.set('t', '<c-d>', function()
        vim.cmd("res -2")
      end)
      vim.keymap.set('t', '<c-b>', function()
        vim.cmd("res =")
      end)
    end
  })
end

M.plugin_cleaner = function()
  vim.cmd("Lazy clean")
end

return M
