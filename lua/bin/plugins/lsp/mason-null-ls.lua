local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.code_actions.shellcheck,
  -- null_ls.builtins.diagnostics.semgrep,
}

null_ls.setup({ sources = sources })
require("mason-null-ls").setup({
  -- ensure_installed = {
    --   "prettier",
    --   "write_good",
    --   "shellcheck",
    -- },
    -- handlers = {},
    automatic_installation = true,
    automatic_setup = false,
  })
