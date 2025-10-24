return {
	-- Scrollbar with diagnostics, search, and git signs
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		opts = {
			show = true,
			handlers = {
				cursor = true,
				diagnostic = true,
				gitsigns = false, -- Enable if you add gitsigns plugin
				handle = true,
				search = true,
			},
		},
	},
}
