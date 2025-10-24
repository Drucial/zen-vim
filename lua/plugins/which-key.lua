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
					{ "gr", desc = "References" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					-- Surround (mini.surround)
					{ "s", group = "surround" },
					{ "sa", desc = "Add surrounding" },
					{ "sd", desc = "Delete surrounding" },
					{ "sr", desc = "Replace surrounding" },
					{ "sf", desc = "Find surrounding (right)" },
					{ "sF", desc = "Find surrounding (left)" },
					{ "sh", desc = "Highlight surrounding" },
					{ "sn", desc = "Update n_lines" },
				},
			},
		},
	},
}
