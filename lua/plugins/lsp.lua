return {
	-- Mason: Package manager for LSP servers, DAP servers, linters, and formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- Mason-LSPConfig: Bridges mason.nvim with lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			-- List of servers to automatically install
			ensure_installed = {
				"lua_ls", -- Lua (for Neovim config)
				"ts_ls", -- TypeScript/JavaScript
				"eslint", -- ESLint for TS/JS linting
				"ruby_lsp", -- Ruby (Rails)
				"pyright", -- Python
				"bashls", -- Bash scripts
				"tailwindcss", -- Tailwind CSS
				"prismals", -- Prisma
				"marksman", -- Markdown
				"jsonls", -- JSON
				"html", -- HTML
				"cssls", -- CSS
			},
			-- Automatically enable installed servers (default: true)
			automatic_enable = true,
			-- Automatically uninstall servers not in ensure_installed
			automatic_installation = {
				exclude = {},
			},
		},
	},

	-- Mason-Tool-Installer: Auto-install formatters and linters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier", -- JS/TS/CSS/HTML/JSON/YAML/Markdown formatter
				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import sorter
				"rubocop", -- Ruby formatter/linter
				"shfmt", -- Shell script formatter
			},
		},
	},

	-- LSPConfig: Configurations for LSP servers
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- LSP Keybindings (set when LSP attaches to buffer)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to definition/declaration
					map("gd", function()
						Snacks.picker.lsp_definitions()
					end, "Goto Definition")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")
					map("gI", function()
						Snacks.picker.lsp_implementations()
					end, "Goto Implementation")
					map("gy", function()
						Snacks.picker.lsp_type_definitions()
					end, "Goto T[y]pe Definition")

					-- References with nowait to prevent which-key submenu (grr, gra, etc.)
					vim.keymap.set("n", "gr", function()
						Snacks.picker.lsp_references()
					end, {
						buffer = event.buf,
						desc = "Goto References",
						nowait = true,
					})

					-- Documentation and signatures
					map("K", vim.lsp.buf.hover, "Hover")
					map("gK", vim.lsp.buf.signature_help, "Signature Help")
					map("<c-k>", vim.lsp.buf.signature_help, "Signature Help", "i")

					-- Code actions
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
					map("<leader>cA", function()
						vim.lsp.buf.code_action({
							context = {
								only = { "source" },
								diagnostics = {},
							},
						})
					end, "Source Action")
					map("<leader>ci", vim.lsp.buf.hover, "Code Info")
					map("<leader>cr", vim.lsp.buf.rename, "Rename")
					map("<leader>cl", "<cmd>LspInfo<cr>", "LSP Info")

					-- Codelens
					if vim.lsp.codelens then
						map("<leader>cc", vim.lsp.codelens.run, "Run Codelens", { "n", "x" })
						map("<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
					end

					-- Diagnostics
					map("[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, "Prev Diagnostic")
					map("]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, "Next Diagnostic")

					-- Document highlight disabled for performance
					-- This feature highlights all occurrences of the symbol under cursor
					-- It fires on every CursorHold/CursorMoved event, causing performance issues
					-- Uncomment below to re-enable if desired:
					--
					-- local client = vim.lsp.get_client_by_id(event.data.client_id)
					-- if client and client.server_capabilities.documentHighlightProvider then
					-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					-- 		buffer = event.buf,
					-- 		callback = vim.lsp.buf.document_highlight,
					-- 	})
					--
					-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					-- 		buffer = event.buf,
					-- 		callback = vim.lsp.buf.clear_references,
					-- 	})
					-- end
				end,
			})

			-- Diagnostic configuration
			vim.diagnostic.config({
				underline = true,
				update_in_insert = false,
				virtual_text = false, -- Disable virtual text, use float on hover instead
				severity_sort = true,
				float = {
					border = "rounded",
					source = "if_many",
				},
			})

			-- Show diagnostics in float on hover (only when diagnostics exist)
			vim.api.nvim_create_autocmd("CursorHold", {
				group = vim.api.nvim_create_augroup("diagnostic_float", { clear = true }),
				callback = function()
					-- Don't show if any float window exists (prevents overlap with hover)
					for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
						if vim.api.nvim_win_get_config(winid).relative ~= "" then
							return
						end
					end

					-- Check if there are diagnostics at the current cursor position
					local cursor_pos = vim.api.nvim_win_get_cursor(0)
					local line = cursor_pos[1] - 1 -- 0-indexed
					local diagnostics = vim.diagnostic.get(0, { lnum = line })

					-- Only show float if diagnostics exist on this line
					if #diagnostics > 0 then
						local opts = {
							focusable = false,
							close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
							border = "rounded",
							source = "if_many",
							prefix = " ",
							max_width = 80, -- Reasonable max width for diagnostic hover
						}
						vim.diagnostic.open_float(nil, opts)
					end
				end,
			})

			-- Set default capabilities with file operations support
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.workspace = {
				fileOperations = {
					didRename = true,
					willRename = true,
				},
			}

			-- Get blink.cmp capabilities (merges with our custom capabilities)
			local has_blink, blink = pcall(require, "blink.cmp")
			if has_blink then
				capabilities = blink.get_lsp_capabilities(capabilities)
			end

			-- Apply capabilities globally to all LSP servers
			vim.lsp.config("*", { capabilities = capabilities })

			-- Enable inlay hints globally for all servers that support it
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-inlay-hints", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
					end
				end,
			})

			-- Configure individual LSP servers using modern API
			-- Note: mason-lspconfig automatically enables these servers via automatic_enable

			-- Lua Language Server (for Neovim config)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- TypeScript/JavaScript
			vim.lsp.config("ts_ls", {
				flags = {
					debounce_text_changes = 150, -- Performance: reduce update frequency
				},
			})

			-- ESLint (diagnostics + autofixes, no formatting)
			vim.lsp.config("eslint", {
				on_attach = function(client, bufnr)
					-- Disable formatting capability (Prettier handles this via conform)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false

					-- Autofix on save (silently, without notifications)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							-- Only apply fixes if there are ESLint diagnostics
							local diagnostics = vim.diagnostic.get(bufnr, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
							if #diagnostics > 0 then
								vim.lsp.buf.code_action({
									context = {
										only = { "source.fixAll.eslint" },
										diagnostics = {},
									},
									apply = true,
								})
							end
						end,
					})
				end,
				settings = {
					workingDirectories = { mode = "auto" },
				},
			})

			-- Ruby (Rails)
			vim.lsp.config("ruby_lsp", {})

			-- Python
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			})

			-- Bash
			vim.lsp.config("bashls", {})

			-- Tailwind CSS - Enhanced for maximum utility
			vim.lsp.config("tailwindcss", {
				-- Ensure Tailwind attaches to these file types
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
				},
				init_options = {
					userLanguages = {
						-- Support for custom template languages
						eelixir = "html-eex",
						eruby = "erb",
					},
				},
				settings = {
					tailwindCSS = {
						-- Completion suggestions
						suggestions = true,
						-- Color decorators in editor
						colorDecorators = true,
						-- Validate Tailwind classes
						validate = true,
						-- Lint for Tailwind-specific issues
						lint = {
							cssConflict = "warning",
							invalidApply = "error",
							invalidConfigPath = "error",
							invalidScreen = "error",
							invalidTailwindDirective = "error",
							invalidVariant = "error",
							recommendedVariantOrder = "warning",
						},
						-- Class attributes for completion
						classAttributes = {
							"class",
							"className",
							"classList",
							"ngClass",
							-- Add custom attributes if you use them
							"class:list", -- Astro
						},
						-- Experimental features
						experimental = {
							-- Support for various CSS-in-JS syntaxes
							classRegex = {
								-- Standard
								"class:\\s*[\"'`]([^\"'`]*)[\"'`]",
								-- Conditional/template strings
								"className\\s*=\\s*[\"'`]([^\"'`]*)[\"'`]",
								-- tw`` template literals (styled-components, emotion)
								"tw`([^`]*)",
								"tw=\"([^\"]*)",
								'tw={"([^"}]*)',
								"tw\\.\\w+`([^`]*)",
								"tw\\(.*?\\)`([^`]*)",
								-- cx/clsx/classnames utilities
								{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
								{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
								{ "classnames\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
								-- Conditional classes
								{ "class:\\s*{([^}]*)}", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							},
						},
						-- Include language you use with Tailwind
						includeLanguages = {
							typescript = "javascript",
							typescriptreact = "javascript",
						},
					},
				},
			})

			-- Prisma
			vim.lsp.config("prismals", {})

			-- Markdown
			vim.lsp.config("marksman", {})

			-- JSON (with schema store for better completion)
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			-- HTML
			vim.lsp.config("html", {})

			-- CSS
			vim.lsp.config("cssls", {})
		end,
	},
}
