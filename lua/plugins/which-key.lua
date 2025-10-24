return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			preset = "helix",
			delay = 300,
			defaults = {},
			spec = {
				{
					mode = { "n", "v" },
					-- Leader groups
					{ "<leader>f", group = "find" },
					{ "<leader>b", group = "buffer" },
					{ "<leader>c", group = "code" },
					{ "<leader>s", group = "search" },
					{ "<leader>sn", group = "noice" },
					{ "<leader>w", group = "window" },
					{ "<leader>g", group = "git" },
					{ "<leader>gh", group = "hunk" },
					{ "<leader>x", group = "diagnostics" },
					-- Navigation groups
					{ "g", group = "goto" },
					{ "gr", desc = "References" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
				},
			},
		},
	},
}
