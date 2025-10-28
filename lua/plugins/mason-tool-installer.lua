return {
	-- Install formatters via Mason
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier", -- JS/TS/CSS/HTML/JSON/YAML/Markdown formatter
				"eslint_d", -- ESLint daemon for fast linting/fixing
				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import sorter
				"rubocop", -- Ruby formatter/linter
				"shfmt", -- Shell script formatter
			},
		},
	},
}
