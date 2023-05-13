require("bin.config.options")
require("bin.config.keymaps")
require("bin.config.lazy")

require('user')

local ok = pcall(require, 'test')
if not ok then
  return
end
