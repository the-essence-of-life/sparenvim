local echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end
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
  { mode = "n", keys = "<c-c>", exec = "<cmd>wq<cr>" },
  -- {
  --   mode = "n",
  --   keys = "<a-e>",
  --   exec = "<cmd>Neotree<cr>"
  -- },
}

M.autocmds = {
  -- {
  --   pattern = "*",
  --   callback = function()
  --     vim.opt.relativenumber = true
  --   end
  -- }
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
      -- { "LazyVim/LazyVim", import = "lazyvim.config" },
      {
        "abeldekat/lazyflex.nvim",
        version = "*",
        cond = true,
        import = "lazyflex.hook",
        opts = {},
      },
      { import = "spare.plugins" },
      -- { import = "user.plugins" },
    },
    git = {
      url_format = "https://github.com/%s.git",
    },
    install = {
      colorscheme = {
        "github_dark",
        "catppuccin",
        "material",
      },
    },
    ui = {
      border = "rounded",
    },
    -- diff = {
    -- cmd = "lazygit"
    -- },
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
    -- dev = {
    --   -- directory where you store your local plugin projects
    --   path = "~/projects",
    --   --[email protected] string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    --   patterns = {},    -- For example {"folke"}
    --   fallback = false, -- Fallback to git when local plugin doesn't exist
    -- },
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
  vim.api.nvim_create_autocmd("LazyClean", {
    pattern = "*",
    callback = function()
      vim.ui.input({ propmt = "Clean Plugins?[N/y]" }, function(input)
        if input == "y" then
          vim.cmd("Lazy clean")
        end
      end)
    end
  })
end

return M
