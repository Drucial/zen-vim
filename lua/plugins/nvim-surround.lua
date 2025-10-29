return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	opts = {
		keymaps = {
			insert = "<C-g>s",
			insert_line = "<C-g>S",
			normal = "<leader>ea", -- surround motion
			normal_cur = "<leader>eA", -- surround current line
			normal_line = "<leader>el", -- surround motion on new lines
			normal_cur_line = "<leader>eL", -- surround current line on new lines
			visual = "<leader>es", -- visual mode surround
			visual_line = "<leader>eS", -- visual mode surround with new lines
			delete = "<leader>ed", -- delete surround
			change = "<leader>ec", -- change surround
			change_line = "<leader>eC", -- change surround with new lines
		},
	},
}
