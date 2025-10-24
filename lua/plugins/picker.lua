return {
	-- Snacks Picker: Modern fuzzy finder
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = {
				enabled = true,
				hidden = true,
				sources = {
					files = {
						hidden = true,
						ignored = true,
						exclude = {
							"**/.git/*",
							"**/node_modules/*",
							"**/dist/*",
							"**/build/*",
							"**/.next/*",
						},
					},
				},
			},
		},
		keys = {
			-- Find commands
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.grep()
				end,
				desc = "Find String (Live Grep)",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Find Help",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Find Recent Files",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Find Word under cursor",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Find Diagnostics",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Config Files",
			},
			{
				"<leader>fp",
				function()
					-- Find projects in ~/Dev directory
					Snacks.picker.files({
						cwd = "~/Dev",
						-- Show only directories at depth 1
						find_command = { "fd", "--type", "d", "--max-depth", "1" },
					})
				end,
				desc = "Find Projects",
			},
			{
				"<leader>fC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Find Commands",
			},
			{
				"<leader>fk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Find Keymaps",
			},
			{
				"<leader>/",
				function()
					Snacks.picker.lines()
				end,
				desc = "Fuzzy search in current buffer",
			},

			-- Buffer commands
			{
				"<leader><leader>",
				function()
					Snacks.picker.buffers()
				end,
				desc = "List Buffers",
			},
			{
				"<leader>bb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "List Buffers",
			},
			{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
			{ "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
			{ "<leader>bp", "<cmd>bprevious<CR>", desc = "Previous Buffer" },
			{ "<leader>bw", "<cmd>write<CR>", desc = "Write Buffer" },
		},
	},
}
