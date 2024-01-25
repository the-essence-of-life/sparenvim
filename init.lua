local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
if vim.loop.fs_stat(user_config) then
  local options = require("user.config")
  if type(options) == "table" then
    require("spare.utils").setup(options)
  end
else
  vim.api.nvim_echo({
    {
      "Welcome use spare!\n",
      -- "WarningMsg"
    },
    {
      "Press any key to start checkhealth.\n",
      "MoreMsg"
    },
  }, true, {})
  vim.fn.getchar()
  vim.cmd("checkhealth spare.utils")
end
