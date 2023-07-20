require("catppuccin").setup({
	transparent_background = false,
	flavour = "frappe",
	term_colors = true,
	style = {
		no_italic = true,
	},
	integrations = {
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = {},
				hints = {},
				warnings = {},
				information = {},
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})
