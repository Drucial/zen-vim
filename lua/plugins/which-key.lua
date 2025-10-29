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
					{ "<leader>e", group = "surround" },
					-- Surround normal mode
					{ "<leader>ea", desc = "Surround motion" },
					{ "<leader>eA", desc = "Surround current line" },
					{ "<leader>el", desc = "Surround motion on new lines" },
					{ "<leader>eL", desc = "Surround current line on new lines" },
					{ "<leader>ed", desc = "Delete surround" },
					{ "<leader>edt", desc = "Delete tag" },
					{ "<leader>edf", desc = "Delete function call" },
					{ "<leader>ec", desc = "Change surround" },
					{ "<leader>eC", desc = "Change surround with new lines" },
					{ "<leader>ect", desc = "Change tag" },
					{ "<leader>ecT", desc = "Change entire tag" },
					{ "<leader>ecf", desc = "Change function" },
					-- Surround visual mode
					{ "<leader>es", desc = "Visual surround", mode = "v" },
					{ "<leader>eS", desc = "Visual surround with new lines", mode = "v" },
					{ "<leader>est", desc = "Surround with tag", mode = "v" },
					{ "<leader>esf", desc = "Surround with function", mode = "v" },
					{ "<leader>eSt", desc = "Surround with tag (new lines)", mode = "v" },
					{ "<leader>eSf", desc = "Surround with function (new lines)", mode = "v" },
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
