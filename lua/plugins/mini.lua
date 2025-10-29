return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		-- mini.pairs - Auto-pair brackets, quotes, etc.
		require("mini.pairs").setup()
		-- mini.comment -
		require("mini.comment").setup()
		-- mini.bufremove
		require("mini.bufremove").setup()
		-- mini.icons
		require("mini.icons").setup()
	end,
}
