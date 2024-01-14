local user_path = vim.fn.stdpath("config") .. "/lua/user/"
local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
if not vim.loop.fs_stat(user_path) then
  vim.fn.system("mkdir", user_path)
end
  if not vim.loop.fs_stat(user_config) then
    local file = io.open(user_config, "w+")
    io.output(file)
    io.write([[
return {
  options = {
    enabled = true,
  },
  keymaps = {
    enabled = true,
  },
  autocmds = {
    enabled = true,
    lastplace = true,
    directory = true,
  },
  plugin = {
    enabled = true,
    mode = "plugins",
  },
}
  ]])
    io.close(file)
  end
local options = require("user.config")
require("spare.utils").setup(options)
-- local function user_command(alias, cmd)
--   vim.api.nvim_create_user_command(alias, cmd, { bang = true })
-- end

-- user_command('SayHello', 'echo "Hello world!"')
