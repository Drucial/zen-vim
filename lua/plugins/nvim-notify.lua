return {
	-- nvim-notify: Notification manager
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#232136", -- rose-pine moon background
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
}
