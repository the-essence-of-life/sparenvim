local null_ls = require("null-ls")
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		null_ls.builtins.code_actions.eslint_d,
		-- null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.diagnostics.shellcheck, -- shell script diagnostics
		-- null_ls.builtins.formatting.shellharden, -- shell script diagnostics
		-- null_ls.builtins.formatting.shfmt, -- shell script diagnostics
		-- null_ls.builtins.completion.luasnip,
		-- null_ls.builtins.completion.tags,
		-- null_ls.builtins.completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
