local echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end
local M = {}

M.deployment_lazy = function()
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

  require("lazy").setup({
    spec = {
      -- { "LazyVim/LazyVim", import = "lazyvim.config" },
      { import = "bin.plugins" },
      -- { import = "bin.plugins.lsp" },
      -- { import = "bin.plugins.tools" },
      -- { import = "bin.plugins.ui" },
      -- { import = "bin.plugins.utils" },
      -- { import = "bin.plugins.user" },
    },
    git = {
      url_format = "https://github.com/%s.git",
    },
    install = {
      colorscheme = { "catppuccin" },
    },
    ui = {
      border = "rounded",
    },
    checker = {
      -- automatically check for plugin updates
      enabled = false,
      concurrency = 1, --[email protected] number? set to 1 to check for updates very slowly
      notify = false, -- get a notification when new updates are found
      frequency = 3600, -- check for updates every hour
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

M.deployment_lazy_user = function()
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

  require("lazy").setup({
    spec = {
      -- { "LazyVim/LazyVim", import = "lazyvim.config" },
      { import = "user.plugins" },
      -- { import = "bin.plugins.lsp" },
      -- { import = "bin.plugins.tools" },
      -- { import = "bin.plugins.ui" },
      -- { import = "bin.plugins.utils" },
      -- { import = "bin.plugins.user" },
    },
    git = {
      url_format = "https://github.com/%s.git",
    },
    -- install = {
    --   colorscheme = { "catppuccin" },
    -- },
    ui = {
      border = "rounded",
    },
    checker = {
      -- automatically check for plugin updates
      enabled = false,
      concurrency = 1, --[email protected] number? set to 1 to check for updates very slowly
      notify = false, -- get a notification when new updates are found
      frequency = 3600, -- check for updates every hour
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

return M
