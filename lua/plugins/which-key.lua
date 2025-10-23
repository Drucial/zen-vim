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
					{ "<leader>s", group = "split" },
					-- Navigation groups
					{ "g", group = "goto" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
				},
			},
		},
	},
}
