return {
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- Copilot source for blink.cmp (requires copilot.lua)
			{
				"giuxtaposition/blink-cmp-copilot",
				dependencies = { "zbirenbaum/copilot.lua" },
			},
		},
		event = "InsertEnter",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'enter' preset: <CR> accepts, <C-n>/<C-p> navigate
			-- This leaves <Tab> free for Copilot
			keymap = {
				preset = "enter",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },
			},

			appearance = {
				-- Use 'mono' for proper icon alignment with Nerd Font Mono
				nerd_font_variant = "mono",
			},

			completion = {
				-- Documentation
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},

				-- Ghost text disabled (conflicts with Copilot)
				ghost_text = {
					enabled = true,
				},

				-- Auto-brackets
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

				-- Menu appearance
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
			},

			-- Sources: Copilot first, then LSP, path, snippets, buffer
			sources = {
				default = { "copilot", "lsp", "path", "snippets", "buffer" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100, -- Boost copilot score to always be first
						async = true,
					},
				},
			},
		},
	},
}
