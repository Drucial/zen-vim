return {
	{
		"folke/snacks.nvim",
		event = "VeryLazy",
		opts = {
			bigfile = { enabled = true },
			indent = {
				enabled = true,
				only_scope = true, -- only show indent guides of the scope
				only_current = true, -- only show indent guides in the current window
			},
			scroll = { enabled = true },
			image = { enabled = true },
			terminal = {
				enabled = true,
				win = {
					position = "right",
					width = 0.3, -- 30% of editor width
					height = 0, -- full height
					wo = {
						statusline = "", -- hide statusline
						winbar = "", -- hide winbar
					},
				},
			},
			zen = {
				enabled = true,
				toggles = {
					dim = false, -- don't dim inactive windows
					git_signs = true, -- hide git signs
					mini_diff = true, -- hide mini.diff
					diagnostics = true, -- hide diagnostics
					inlay_hints = true, -- hide inlay hints
				},
				show = {
					statusline = false, -- hide statusline
					tabline = false, -- hide tabline
				},
				win = {
					width = 110, -- width in columns (or use 0.8 for 80% of screen)
					height = 0, -- 0 = full height
				},
				on_open = function()
					-- Save current line number settings
					vim.b.zen_number = vim.wo.number
					vim.b.zen_relativenumber = vim.wo.relativenumber
					-- Disable line numbers
					vim.wo.number = false
					vim.wo.relativenumber = false
				end,
				on_close = function()
					-- Restore line number settings
					vim.wo.number = vim.b.zen_number
					vim.wo.relativenumber = vim.b.zen_relativenumber
				end,
			},
			dashboard = {
				enabled = true,
				preset = {
					--styula:ignore start
					header = [[
┏┓┏┓┳┓┓┏┳┳┳┓
┏┛┣ ┃┃┃┃┃┃┃┃
┗┛┗┛┛┗┗┛┻┛ ┗

01011010 01000101 01001110 01010110 01001001 01001101
]],
					-- styula:ignore end
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.picker.files()",
						},
						{ icon = "", key = "y", desc = "File Browser", action = "<CMD>Oil<CR>" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.picker.grep()",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.picker.recent()",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						-- { icon = ' ', key = 'x', desc = 'Lazy Extras', action = ':LazyExtras' },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
		},
	},
}
