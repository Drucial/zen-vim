return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		-- mini.pairs - Auto-pair brackets, quotes, etc.
		require("mini.pairs").setup()
		-- mini.surround - Add/delete/replace surroundings (brackets, quotes, etc.)
		require("mini.surround").setup()
		-- mini.comment -
		require("mini.comment").setup()
		-- mini.bufremove
		require("mini.bufremove").setup()
		-- mini.animate
		-- require("mini.animate").setup()
		-- mini.icons
		require("mini.icons").setup()
		-- mini.statusline
		-- require("mini.statusline").setup()
	end,
}
