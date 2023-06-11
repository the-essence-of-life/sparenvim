vim.api.nvim_create_autocmd("BufWrite", {
	pattern = {
		"*.lua",
	},
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
