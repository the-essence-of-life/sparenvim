require("autoclose").setup({
	keys = {
		["$"] = { escape = true, close = true, pair = "$$" },
		["["] = { escape = false, close = true, pair = "[]" },
		["{"] = { escape = false, close = true, pair = "{}" },
		[")"] = { escape = true, close = false, pair = "()" },
		["]"] = { escape = true, close = false, pair = "[]" },
		["}"] = { escape = true, close = false, pair = "{}" },
		['"'] = { escape = true, close = true, pair = '""' },
		["'"] = { escape = true, close = true, pair = "''" },
		["`"] = { escape = true, close = true, pair = "``" },
		["("] = { escape = true, close = true, pair = "()" },
	},
	options = {
		disable_when_touch = true,
	},
})
