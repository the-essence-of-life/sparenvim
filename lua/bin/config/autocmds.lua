-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = {
--     "lua"
--   },
--   callback = function ()
--     vim.lsp.buf.format({ async = true })
--   end
-- })

local M = {}
return M
