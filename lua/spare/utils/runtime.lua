local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
if vim.loop.fs_stat(user_config) then
  require("spare.utils.env")
  local options = require("user.config") or require("user") or require("user.config").default
  if type(options) == "table" then
    require("spare.utils").setup(options)
  end
else
  vim.opt.termguicolors = true
  vim.cmd("colorscheme habamax")
  local hl_gruop = {
    healthError = "red",
    healthWarning = "yellow",
    healthSuccess = "green",
    MoreMsg = "#ffcb74",
  }
  for hl_name, color in pairs(hl_gruop) do
    vim.api.nvim_set_hl(0, hl_name, { fg = color })
  end
  vim.ui.select({ 'Checkhealth', 'Default', 'Customize' }, {
    prompt = 'Getting Started:',
  }, function(choice)
    if choice == "Checkhealth" then
      vim.cmd("checkhealth spare.utils")
    elseif choice == "Default" then
      local default_config = vim.fn.stdpath("config") .. "/lua/spare/utils/default.txt"
      local user_folder = vim.fn.stdpath("config") .. "/lua/user/"
      if not vim.loop.fs_stat(user_folder) then
	vim.fn.mkdir(user_folder)
      end
      if vim.fn.has("win") == 1 then
        vim.fn.system({ "Move-Item", "-Path", default_config, "-Destination", user_config })
      else
        vim.fn.system({ "cp", default_config, user_config })
      end
      vim.api.nvim_echo({
        {
          "\nPress ENTER to reload neovim.",
          "MoreMsg"
        }
      }, true, {})
      vim.fn.getchar()
      vim.cmd("q")
    elseif choice == "Customize" then
      local config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
      vim.cmd.edit { config }
    end
  end)
end
