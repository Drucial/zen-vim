return {
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "InsertEnter",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' preset: Ctrl+Y accepts, manual trigger
			-- This leaves <Tab> free for Supermaven
			keymap = {
				preset = "default",
				-- Manual trigger only
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-y>"] = { "select_and_accept" },
				-- Arrow keys for navigation
				["<Up>"] = { "select_prev" },
				["<Down>"] = { "select_next" },
				-- Enter only accepts if explicitly selected
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				-- Use 'mono' for proper icon alignment with Nerd Font Mono
				nerd_font_variant = "mono",
			},

			completion = {
				-- Trigger: Auto-show while typing
				trigger = {
					show_on_insert = true,
					show_on_keyword = true,
					show_on_backspace = true,
					show_on_trigger_character = true,
				},

				-- Documentation: Auto-show with slight delay
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						max_width = 80,
						max_height = 20,
						border = "rounded",
					},
				},

				-- Ghost text DISABLED (conflicts with Supermaven)
				ghost_text = {
					enabled = false,
				},

				-- Auto-brackets
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},

				-- List: No preselection, no auto-insert
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},

				-- Menu: Auto-show enabled
				menu = {
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
					},
				},
			},

			-- Sources: LSP, path, snippets, buffer (no Copilot - using Supermaven)
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
