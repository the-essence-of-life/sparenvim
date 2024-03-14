local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
if vim.loop.fs_stat(user_config) then
  require("spare.utils.env")
  local options = require("user.config")
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
    ModeMsg = "white",
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
    local user_config = vim.fn.stdpath("config") .. "/lua/user/config.lua"
    vim.fn.system({"cp", default_config, user_config})
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

  -- vim.api.nvim_echo({
  --   {
  --     "Welcome use spare!\n",
  --   },
  --   {
  --     "Press any key to start checkhealth.\n",
  --     "MoreMsg"
  --   },
  -- }, true, {})
  -- vim.fn.getchar()
  -- vim.cmd("checkhealth spare.utils")
end
