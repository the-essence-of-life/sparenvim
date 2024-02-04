local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
if vim.loop.fs_stat(user_config) then
  local options = require("user.config")
  if type(options) == "table" then
    require("spare.utils").setup(options)
  end
else
  vim.opt.termguicolors = true
  vim.cmd("colorscheme habamax")
  local hl_group = {
    "healthError",
    "healthWarning",
    "healthSuccess",
    "ModeMsg",
    "MoreMsg",
  }

  local colors = {
    "red",
    "yellow",
    "green",
    "white"
  }
  vim.api.nvim_set_hl(0, hl_group[1], { fg = colors[1] })
  vim.api.nvim_set_hl(0, hl_group[2], { fg = colors[2] })
  vim.api.nvim_set_hl(0, hl_group[3], { fg = colors[3] })
  vim.api.nvim_set_hl(0, hl_group[4], { fg = colors[4] })
  vim.api.nvim_set_hl(0, hl_group[5], { fg = colors[4] })
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
