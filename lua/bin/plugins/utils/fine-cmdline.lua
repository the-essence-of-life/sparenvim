vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

require("fine-cmdline").setup({
	cmdline = {
		prompt = "> ",
	},
})
