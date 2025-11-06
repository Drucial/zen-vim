return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3 -- global statusline (required for proper collapse)
		vim.opt.splitkeep = "screen" -- keep screen stable when opening/closing windows
	end,
	opts = {
		-- Bottom panel: QuickFix, Diagnostics, Help
		bottom = {
			-- QuickFix / Location List
			{
				ft = "qf",
				title = "QuickFix",
				size = { height = 20 },
			},

			-- Trouble diagnostics
			{
				ft = "trouble",
				title = "Diagnostics",
				size = { height = 20 },
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},

			-- Help windows
			{
				ft = "help",
				title = "Help",
				size = { height = 20 },
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
		},

		-- Right panel: Terminal
		right = {
			-- Snacks terminal
			{
				ft = "snacks_terminal",
				size = { width = 0.3 }, -- 30% of screen width
				title = "Terminal",
				filter = function(buf, win)
					-- Only capture non-floating windows
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},

			-- Alternative: if snacks uses "terminal" filetype
			{
				ft = "terminal",
				size = { width = 0.3 },
				title = "Terminal",
				filter = function(buf, win)
					return vim.api.nvim_win_get_config(win).relative == ""
						and vim.bo[buf].filetype == "terminal"
				end,
			},
		},

		-- Left panel: Search & Replace
		left = {
			-- Grug-far search and replace
			{
				ft = "grug-far",
				size = { width = 0.3 }, -- 30% of screen width
				title = "Search & Replace",
			},
		},

		-- Keys for edge window navigation
		keys = {
			["q"] = function(win)
				win:close()
			end,
			["<c-q>"] = function(win)
				win:hide()
			end,
			["Q"] = function(win)
				win.view.edgebar:close()
			end,
		},

		-- Animation settings
		animate = {
			enabled = true,
			fps = 100,
			cps = 120,
		},

		-- Global window options for all edge windows
		wo = {
			winbar = true,
			winfixwidth = true,
			winfixheight = false,
			winhighlight = "",
			spell = false,
			signcolumn = "no",
		},

		-- Don't automatically open when no windows match
		exit_when_last = false,

		-- Close edgy when only one window is visible
		close_when_all_hidden = true,
	},
}
