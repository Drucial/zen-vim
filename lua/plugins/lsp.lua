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
					map("<leader>cR", function()
						-- File rename functionality (requires workspace.fileOperations support)
						local old_name = vim.api.nvim_buf_get_name(0)
						vim.ui.input({ prompt = "New file name: ", default = old_name }, function(new_name)
							if new_name and new_name ~= old_name then
								vim.lsp.buf.rename(new_name)
							end
						end)
					end, "Rename File")
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
				callback = function()
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
			vim.lsp.config("ts_ls", {})

			-- ESLint
			vim.lsp.config("eslint", {})

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

			-- Tailwind CSS
			vim.lsp.config("tailwindcss", {
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								"tw`([^`]*)",
								'tw="([^"]*)',
								'tw={"([^"}]*)',
								"tw\\.\\w+`([^`]*)",
								"tw\\(.*?\\)`([^`]*)",
							},
						},
					},
				},
			})

			-- Prisma
			vim.lsp.config("prismals", {})

			-- Markdown
			vim.lsp.config("marksman", {})

			-- JSON
			vim.lsp.config("jsonls", {})

			-- HTML
			vim.lsp.config("html", {})

			-- CSS
			vim.lsp.config("cssls", {})
		end,
	},
}
