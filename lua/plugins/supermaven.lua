return {
	{
		"supermaven-inc/supermaven-nvim",
		event = "InsertEnter",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Tab>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-j>",
				},
				ignore_filetypes = {},
				color = {
					suggestion_color = "#6e6a86", -- Muted gray-purple from rose-pine
					cterm = 244,
				},
				log_level = "info", -- Change to "off" to disable logging
				disable_inline_completion = false,
				disable_keymaps = false,
			})
		end,
	},
}
