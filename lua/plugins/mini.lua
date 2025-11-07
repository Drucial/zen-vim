return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		-- mini.pairs - Auto-pair brackets, quotes, etc.
		require("mini.pairs").setup()

		-- mini.comment - Better commenting with JSX/TSX support
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})

		-- mini.icons
		require("mini.icons").setup()

		-- mini.bufremove - Delete buffers without messing up window layout
		require("mini.bufremove").setup()
	end,
}
