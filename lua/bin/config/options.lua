local opt = vim.opt
local M = {}
M.options = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  local options = {
    autowrite = true,        -- Enable auto write
    clipboard = "unnamedplus", -- Sync with system clipboard
    completeopt = "menu,menuone,noselect",
    conceallevel = 3,        -- Hide * markup for bold and italic
    confirm = true,          -- Confirm to save changes before exiting modified buffer
    cursorline = true,       -- Enable highlighting of the current line
    expandtab = true,        -- Use spaces instead of tabs
    formatoptions = "jcroqlnt", -- tcqj
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --vimgrep",
    ignorecase = true,   -- Ignore case
    inccommand = "nosplit", -- preview incremental substitute
    laststatus = 0,
    list = true,         -- Show some invisible characters (tabs...
    mouse = "a",         -- Enable mouse mode
    number = true,       -- Print line number
    pumblend = 10,       -- Popup blend
    pumheight = 10,      -- Maximum number of entries in a popup
    relativenumber = true, -- Relative line numbers
    scrolloff = 4,       -- Lines of context
    sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
    shiftround = true,   -- Round indent
    shiftwidth = 2,      -- Size of an indent
    --	shortmess:append({ W = true, I = true, c = true }),
    showmode = false,    -- Dont show mode since we have a statusline
    sidescrolloff = 8,   -- Columns of context
    signcolumn = "yes",  -- Always show the signcolumn, otherwise it would shift the text each time
    smartcase = true,    -- Don't ignore case with capitals
    smartindent = true,  -- Insert indents automatically
    spelllang = { "en" },
    splitbelow = true,   -- Put new windows below current
    splitright = true,   -- Put new windows right of current
    tabstop = 2,         -- Number of spaces tabs count for
    termguicolors = true, -- True color support
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
    winminwidth = 5,             -- Minimum window width
    wrap = false,                -- Disable line wrap
    winminwidth = 5,                -- Minimum window width
    wrap = false,                   -- Disable line wrap
  }

  for k, v in pairs(options) do
    opt[k] = v
  end
end

M.others = function()
  if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append({ C = true })
  end

  opt.shortmess:append({ W = true, I = true, c = true })

  -- Fix markdown indentation settings
  vim.g.markdown_recommended_style = 0

  vim.cmd("filetype plugin indent on")
  vim.o.foldtext         = ""
  vim.o.swap             = false

  vim.g.netrw_liststyle  = 3
  vim.g.netrw_preview    = 1
  vim.g.netrw_alto       = 0
  vim.g.netrw_chgwin     = 2
  vim.cmd([[
	au BufReadCmd *.zip,*.jar,*.xpi call zip#Browse(expand("<amatch>"))
  ]])
end

return M
