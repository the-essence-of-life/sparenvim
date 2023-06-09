return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		dependencies = {
			-- {"williamboman/mason-lspconfig.nvim", config = true},
			{ "neovim/nvim-lspconfig" },
			-- {"glepnir/lspsaga.nvim", config = true},
			-- "jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("bin.plugins.lsp.lsp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"amarakon/nvim-cmp-buffer-lines",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("bin.plugins.lsp.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		-- config = function()
		-- 	require("bin.plugins.lsp.lsp")
		-- end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		-- dependencies = {
		-- 'jose-elias-alvarez/typescript.nvim',
		-- "neovim/nvim-lspconfig",
		-- },
		config = function()
			require("bin.plugins.lsp.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	},
	-- {
	--   'jose-elias-alvarez/typescript.nvim',
	--   ft = {
	--     'tsx',
	--     'ts',
	--     'vue',
	--     'jsx',
	--   },
	--   config = function ()
	--     require("bin.plugins.lsp.typescript")
	--   end
	-- },
	-- {
	--   "jose-elias-alvarez/null-ls.nvim",
	--   dependencies = {
	--     "jay-babu/mason-null-ls.nvim",
	--   },
	--   config = require('bin.plugins.lsp.null-ls')
	-- },
}
