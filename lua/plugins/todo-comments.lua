return {
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", function() Snacks.picker.grep({ search = "TODO|HACK|PERF|NOTE|WARNING" }) end, desc = "Todo" },
      { "<leader>sT", function() Snacks.picker.grep({ search = "TODO|FIX|FIXME" }) end, desc = "Todo/Fix/Fixme" },
    },
	},
}
