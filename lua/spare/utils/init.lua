local M = {}
function M.setup(config)
  local Cfg = require("spare.utils.tables"):set(config):get()
  if Cfg.options then
    if Cfg.options.enabled then
      if type(Cfg.options.set) == "table" then
        for k, v in pairs(Cfg.options.set) do
          vim.opt[k] = v
        end
      end
    end
  end
  if Cfg.keymaps then
    if Cfg.keymaps.enabled then
      if type(Cfg.keymaps.set) == "table" then
        for _, mappings in ipairs(Cfg.keymaps.set) do
          vim.keymap.set(mappings.mode, mappings.keys, mappings.exec)
        end
      end
    end
  end
  if Cfg.autocmds then
    if Cfg.autocmds.enabled then
      if Cfg.autocmds.lastplace then
        require("spare.utils.autocmds").lastplace()
      end
      if Cfg.autocmds.directory then
        require("spare.utils.autocmds").directory()
      end
      if type(Cfg.autocmds.set) ~= "table" then
        for _, autocmds in ipairs(Cfg.autocmds.set) do
          vim.api.nvim_create_autocmd(autocmds.event or "BufRead", {
            pattern = autocmds.pattern,
            callback = function()
              autocmds.callback()
            end
          })
        end
      end
    end
  end
  if Cfg.autocmds.enabled then
    if Cfg.plugin.mode == "plugin-manager" then
      require("spare.utils.lazy").pm_bootstraping()
    elseif Cfg.plugin.mode == "plugins" then
      require("spare.utils.lazy").pm_bootstraping()
      require("spare.utils.lazy").deployment_lazy()
    end
    if type(Cfg.plugin.bootstraping) == "function" then
      Cfg.plugin.bootstraping()
    end
  end
end
return M
