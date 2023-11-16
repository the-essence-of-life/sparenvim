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
  laststatus = 0,
  list = true,            -- Show some invisible characters (tabs...
  mouse = "a",            -- Enable mouse mode
  number = true,          -- Print line number
  pumblend = 10,          -- Popup blend
  relativenumber = true,  -- Relative line numbers
  scrolloff = 4,          -- Lines of context
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
  shiftround = true,      -- Round indent
  shiftwidth = 2,         -- Size of an indent
  --	shortmess:append({ W = true, I = true, c = true }),
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
}

M.autocmds = {
  {}
}

return M
