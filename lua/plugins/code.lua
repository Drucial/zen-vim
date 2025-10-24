return {
	-- Autoformatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Code Format",
			},
		},
		opts = {
			formatters_by_ft = {
				javascript = { "eslint_d", "prettier" },
				typescript = { "eslint_d", "prettier" },
				javascriptreact = { "eslint_d", "prettier" },
				typescriptreact = { "eslint_d", "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				ruby = { "rubocop" },
				sh = { "shfmt" },
			},
			-- Format on save
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" }, -- 2 space indentation
				},
			},
		},
		init = function()
			-- Command to toggle format on save
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					-- FormatDisable! will disable formatting just for this buffer
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, {
				desc = "Disable autoformat-on-save",
				bang = true,
			})
			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {
				desc = "Re-enable autoformat-on-save",
			})
		end,
	},

	-- Install formatters via Mason
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier", -- JS/TS/CSS/HTML/JSON/YAML/Markdown formatter
				"eslint_d", -- ESLint daemon for fast linting/fixing
				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import sorter
				"rubocop", -- Ruby formatter/linter
				"shfmt", -- Shell script formatter
			},
		},
	},

	-- Search and replace
	{
		"MagicDuck/grug-far.nvim",
		opts = {
			headerMaxWidth = 80,
			windowCreationCommand = "topleft vsplit",
		},
		cmd = { "GrugFar", "GrugFarWithin" },
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "x" },
				desc = "Search and Replace",
			},
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      -- Simulate nvim-treesitter incremental selection
      { "<c-space>", mode = { "n", "o", "x" },
        function()
          require("flash").treesitter({
            actions = {
              ["<c-space>"] = "next",
              ["<BS>"] = "prev"
            }
          })
        end, desc = "Treesitter Incremental Selection" },
    },
	},

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
