local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
if vim.loop.fs_stat(user_config) then
  -- local user_path = vim.fn.stdpath("config") .. "/lua/user/"
  -- if not vim.loop.fs_stat(user_path) then
  --   vim.fn.system("mkdir", user_path)
  -- end
  local options = require("user.config")
  if type(options) == "table" then
    require("spare.utils").setup(options)
  end
  -- local p_opts = require("user.plugins")
  -- require("spare.utils.funs").ps(p_opts)
else
  vim.api.nvim_echo({
    {
      "Welcome use spare!\n",
      "WarningMsg"
    },
    {
      "Press any key to start checkhealth.\n",
      "MoreMsg"
    },
  }, true, {})
  vim.fn.getchar()
  vim.cmd("checkhealth spare.utils")
end
