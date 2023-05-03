require("dashboard").setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
      -- desc,icon,icon_hl,action,group,key
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope menu",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Lazy",
				key = "d",
			},
		},
	},
})
