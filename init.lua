-- Input "gf" in normal mode to jump to configuration.
-- ~/.config/nvim/lua/user/
-- local spare_path = vim.fn.stdpath("config") .. "/spare.nvim"
-- if not vim.loop.fs_stat(spare_path) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/the-essence-of-life.git",
--     spare_path,
--   })
--   local before_p = spare_path .. "/lua/spare/"
--   local after_p = vim.fn.stdpath("config") .. "/lua/"
--   vim.fn.system({"mv", before_p, after_p})
--   vim.fn.system({"rm", "-rf", spare_path})
-- end
-- require("spare").setup()

require("spare").setup()
