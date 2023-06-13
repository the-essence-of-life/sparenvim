-- M = {}
--
-- M.options = require("bin.config.options")
-- M.keymaps = require("bin.config.keymaps")
-- M.plugins = require("bin.config.lazy")
--
-- return M

local m = {
  -- Your require modules.
  -- e.g: require('modules.name.path')
  -- =>'modules.name.path',
  "bin.config.options",
  "bin.config.keymaps",
  "bin.config.lazy",
}
for _, modules in ipairs(m) do
  require(modules)
end
