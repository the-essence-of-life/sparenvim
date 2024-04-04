vim.api.nvim_echo({
  {
    "This repositary should use starter.\n",
    "ErrorMsg"
  },
  {
    "Use `rm -rf ~/.config/nvim/` to remove it.\n",
    "WarningMsg"
  },
  { "Press any key to exit.", "MoreMsg" }
}, true, {})

vim.fn.getchar()
vim.cmd("quit")
