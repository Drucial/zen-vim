return {
	-- Telescope: Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "master", -- Use master for Neovim 0.11 compatibility
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						".git/",
						"dist",
						"build",
						"target",
					},
					path_display = { "truncate" },
					layout_config = {
						horizontal = {
							preview_width = 0.55,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})

			-- Load fzf extension if available
			pcall(telescope.load_extension, "fzf")

			-- Keybindings
			local builtin = require("telescope.builtin")

			-- Find commands
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find String" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under cursor" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
			vim.keymap.set("n", "<leader>fc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Find Config Files" })
			vim.keymap.set("n", "<leader>fp", function()
				local previewers = require("telescope.previewers")

				builtin.find_files({
					cwd = "~/Dev",
					find_command = { "fd", "--type", "d", "--max-depth", "1" },
					prompt_title = "Find Projects",
					previewer = previewers.new_termopen_previewer({
						get_command = function(entry)
							local dir = entry.path or entry.value
							-- Try eza first (modern, colorful), fallback to tree
							if vim.fn.executable("eza") == 1 then
								return {
									"eza",
									"--tree",
									"--level=2",
									"--icons",
									"--color=always",
									"--git-ignore",
									"--ignore-glob=node_modules|.git|dist|build|target|.next|.turbo|coverage",
									dir,
								}
							elseif vim.fn.executable("tree") == 1 then
								return { "tree", "-L", "2", "-C", "-I", "node_modules|.git|dist|build", dir }
							else
								return { "ls", "-la", dir }
							end
						end,
					}),
					attach_mappings = function(_, map)
						map("i", "<CR>", function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							require("telescope.actions").close(prompt_bufnr)
							local dir = selection.path or selection.value
							vim.cmd("cd " .. vim.fn.fnameescape(dir))
							print("Changed directory to: " .. dir)
						end)
						return true
					end,
				})
			end, { desc = "Find Projects" })
			vim.keymap.set("n", "<leader>fC", builtin.commands, { desc = "Find Commands" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Fuzzy search in current buffer" })

			-- Buffer commands
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "List Buffers" })
			vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "List Buffers" })
			vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
			vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
			vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
			vim.keymap.set("n", "<leader>bw", "<cmd>write<CR>", { desc = "Write Buffer" })
		end,
	},
}
