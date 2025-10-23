return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts_extend = { "spec" },
		opts = {
			preset = "helix",
			delay = 500,
			defualts = {},
			spec = {
				{
					mode = { "n", "v" },
					-- Leader groups
					{ "<leader>f", group = "find" },
					{ "<leader>c", group = "code" },
					{ "<leader>s", group = "split" },
					{ "<leader>t", group = "tab" },
					-- Navigation groups
					{ "g", group = "goto" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
				},
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
