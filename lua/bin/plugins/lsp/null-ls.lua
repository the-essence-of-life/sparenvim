local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.shellcheck, -- shell script diagnostics
    null_ls.builtins.formatting.shellharden, -- shell script diagnostics
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.completion.tags,
    -- null_ls.builtins.completion.spell,
  },
})
