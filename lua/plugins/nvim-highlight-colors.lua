return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = {
			-- Render mode: 'background', 'foreground', 'virtual'
			render = "virtual",
			-- Highlight tailwind colors
			enable_tailwind = true,
			-- Highlight named colors (e.g. 'red', 'blue')
			enable_named_colors = true,
			-- Custom colors (hex, rgb, hsl, etc)
			custom_colors = {
				-- Add custom color patterns if needed
			},
		},
	},
}
