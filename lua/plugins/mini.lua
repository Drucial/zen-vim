return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		-- mini.pairs - Auto-pair brackets, quotes, etc.
		require("mini.pairs").setup()
		-- mini.comment
		require("mini.comment").setup()
		-- mini.icons
		require("mini.icons").setup()
		-- mini.bufremove - Delete buffers without messing up window layout
		require("mini.bufremove").setup()
	end,
}
