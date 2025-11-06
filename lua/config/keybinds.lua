-- Keybinds
local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Terminal navigation (works with vim-kitty-navigator)
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- Navigation handled by vim-kitty-navigator plugin
-- <C-h>, <C-j>, <C-k>, <C-l> are set by the plugin

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up and down
keymap.set("n", "<A-S-Down>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-S-Up>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-S-Down>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
keymap.set("v", "<A-S-Up>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Duplicate lines up and down
keymap.set("n", "<C-S-Down>", ":t.<CR>==", { desc = "Duplicate line below" })
keymap.set("n", "<C-S-Up>", ":t.-1<CR>==", { desc = "Duplicate line above" })
keymap.set("v", "<C-S-Down>", ":t'><CR>gv=gv", { desc = "Duplicate lines below" })
keymap.set("v", "<C-S-Up>", ":t'<-1<CR>gv=gv", { desc = "Duplicate lines above" })

-- Keep cursor centered
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "<C-Down>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-Up>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Paste without yanking
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Delete without yanking
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Change without yanking
keymap.set({ "n", "v" }, "c", [["_c]], { desc = "Change without yanking" })
keymap.set({ "n", "v" }, "C", [["_C]], { desc = "Change to end of line without yanking" })

-- Window management (LazyVim-style)
-- Note: <leader>w group is defined in which-key.lua

-- Navigation
keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Go to Left Window" })
keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Go to Lower Window" })
keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Go to Upper Window" })
keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Go to Right Window" })
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Switch Windows" })

-- Move windows to edges
keymap.set("n", "<leader>wH", "<C-W>H", { desc = "Move Window Far Left" })
keymap.set("n", "<leader>wJ", "<C-W>J", { desc = "Move Window Far Down" })
keymap.set("n", "<leader>wK", "<C-W>K", { desc = "Move Window Far Up" })
keymap.set("n", "<leader>wL", "<C-W>L", { desc = "Move Window Far Right" })

-- Splits
keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split Window Below" })
keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split Window Right" })
keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below" })
keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right" })

-- Close/Quit
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
keymap.set("n", "<leader>wq", "<C-W>q", { desc = "Quit Window" })
keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Close All Other Windows" })

-- Resize
keymap.set("n", "<leader>w+", "<cmd>resize +2<CR>", { desc = "Increase Height" })
keymap.set("n", "<leader>w-", "<cmd>resize -2<CR>", { desc = "Decrease Height" })
keymap.set("n", "<leader>w>", "<cmd>vertical resize +2<CR>", { desc = "Increase Width" })
keymap.set("n", "<leader>w<", "<cmd>vertical resize -2<CR>", { desc = "Decrease Width" })
keymap.set("n", "<leader>w=", "<C-W>=", { desc = "Equalize Windows" })

-- Maximize
keymap.set("n", "<leader>w_", "<C-W>_", { desc = "Maximize Height" })
keymap.set("n", "<leader>w|", "<C-W>|", { desc = "Maximize Width" })

-- Swap & Zoom
keymap.set("n", "<leader>wx", "<C-W>x", { desc = "Swap with Next" })
keymap.set("n", "<leader>wm", function()
	Snacks.zen.zoom()
end, { desc = "Maximize Toggle (Zoom)" })

-- UI toggles
keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })

-- Quick single-letter shortcuts (LazyVim-style)
keymap.set("n", "<leader>W", "<cmd>w<CR>", { desc = "Write/Save Buffer" })
keymap.set("n", "<leader>X", function()
	require("mini.bufremove").delete()
end, { desc = "Delete Buffer" })
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy Plugin Manager" })
keymap.set("n", "<leader>n", "<cmd>Noice history<cr>", { desc = "Notification History" })

-- Quick buffer actions (Alt key)
keymap.set({ "n", "i", "v" }, "<A-s>", "<cmd>w<CR>", { desc = "Write/Save Buffer" })
keymap.set({ "n", "i", "v" }, "<A-w>", function()
	require("mini.bufremove").delete()
end, { desc = "Close Buffer" })

-- Terminal Management with Stacking
-- Store terminal references by count
_G.terminal_stack = _G.terminal_stack or {}

-- Helper function to switch terminals (hide all others, show target)
local function switch_terminal(target_count)
	-- Hide all visible terminals
	local terminals = Snacks.terminal.list()
	for _, term in ipairs(terminals) do
		if term:valid() and vim.api.nvim_win_is_valid(term.win) then
			term:hide()
		end
	end

	-- Get or create target terminal
	local target_term = _G.terminal_stack[target_count]

	-- Check if terminal is valid (handle cases where :valid() might fail)
	local is_valid = false
	if target_term and target_term.buf and vim.api.nvim_buf_is_valid(target_term.buf) then
		is_valid = true
	end

	if is_valid then
		-- Show existing terminal
		target_term:show()
	else
		-- Create new terminal with count using get (which returns term, created)
		local term, created = Snacks.terminal.get(nil, {
			count = target_count,
			win = {
				position = "right",
				width = 0.30,
				stack = true
			}
		})
		_G.terminal_stack[target_count] = term

		-- Show the terminal if it was just created or hidden
		if not term.win or not vim.api.nvim_win_is_valid(term.win) then
			term:show()
		end
	end
end

-- Quick access to default terminal (Alt key - works in all modes)
keymap.set({ "n", "i", "v", "t" }, "<A-\\>", function()
	switch_terminal(1)
end, { desc = "Toggle Terminal #1" })

-- Quick access to specific terminals 1-5 (Alt+number)
for i = 1, 5 do
	local count = i -- Capture the value in a local variable
	keymap.set({ "n", "i", "v", "t" }, "<A-" .. count .. ">", function()
		switch_terminal(count)
	end, { desc = "Toggle Terminal #" .. count })
end

-- Leader-based terminal commands
keymap.set("n", "<leader>\\", function()
	switch_terminal(1)
end, { desc = "Toggle Terminal" })

-- Quick access to specific terminals (leader + t + number)
for i = 1, 5 do
	local count = i -- Capture the value in a local variable
	keymap.set("n", "<leader>t" .. count, function()
		switch_terminal(count)
	end, { desc = "Toggle Terminal #" .. count })
end

-- Terminal picker - fuzzy find through all terminals
keymap.set("n", "<leader>tt", function()
	-- Use our tracked terminals instead of Snacks.terminal.list()
	local items = {}
	for count, term in pairs(_G.terminal_stack) do
		-- Check if terminal is valid (handle both :valid() method and direct buffer check)
		local is_valid = false
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			is_valid = true
		end

		if is_valid then
			local buf = term.buf
			local term_info = vim.b[buf].snacks_terminal or {}
			local cmd = term_info.cmd or "shell"
			local cwd = term_info.cwd or vim.fn.getcwd()
			local short_cwd = vim.fn.fnamemodify(cwd, ":~")
			local label = string.format("Terminal #%s: %s (%s)", count, short_cwd, cmd)

			table.insert(items, {
				text = label,
				terminal = term,
				count = count,
			})
		end
	end

	if #items == 0 then
		vim.notify("No terminals open", vim.log.levels.INFO)
		return
	end

	-- Sort by count
	table.sort(items, function(a, b)
		return a.count < b.count
	end)

	vim.ui.select(items, {
		prompt = "Select Terminal:",
		format_item = function(item)
			return item.text
		end,
	}, function(choice)
		if choice then
			switch_terminal(choice.count)
		end
	end)
end, { desc = "Pick Terminal" })

-- Create new terminal in stack
keymap.set("n", "<leader>tn", function()
	-- Find the next available count
	local max_count = 0
	for count, term in pairs(_G.terminal_stack) do
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			max_count = math.max(max_count, count)
		end
	end

	local new_count = max_count + 1
	switch_terminal(new_count)
	vim.notify("Created Terminal #" .. new_count, vim.log.levels.INFO)
end, { desc = "New Terminal" })

-- Toggle all terminals (show/hide)
keymap.set("n", "<leader>ta", function()
	if not _G.terminal_stack or vim.tbl_isempty(_G.terminal_stack) then
		vim.notify("No terminals open", vim.log.levels.INFO)
		return
	end

	-- Check if any terminal is currently visible
	local any_visible = false
	for _, term in pairs(_G.terminal_stack) do
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) and term.win and vim.api.nvim_win_is_valid(term.win) then
			any_visible = true
			break
		end
	end

	-- Toggle all terminals
	for _, term in pairs(_G.terminal_stack) do
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			if any_visible then
				term:hide()
			else
				term:show()
			end
		end
	end
end, { desc = "Toggle All Terminals" })

-- Navigation between terminals in stack (when in terminal mode)
keymap.set("t", "<A-]>", function()
	if not _G.terminal_stack or vim.tbl_isempty(_G.terminal_stack) then
		return
	end

	-- Build sorted list of terminal counts
	local counts = {}
	for count, term in pairs(_G.terminal_stack) do
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			table.insert(counts, count)
		end
	end
	table.sort(counts)

	if #counts <= 1 then
		return
	end

	-- Find current terminal
	local current_buf = vim.api.nvim_get_current_buf()
	local current_count = nil
	for _, count in ipairs(counts) do
		if _G.terminal_stack[count].buf == current_buf then
			current_count = count
			break
		end
	end

	if current_count then
		-- Find next count
		local current_idx = vim.tbl_contains(counts, current_count) and vim.fn.index(counts, current_count) + 1 or 1
		local next_idx = (current_idx % #counts) + 1
		switch_terminal(counts[next_idx])
	end
end, { desc = "Next Terminal" })

keymap.set("t", "<A-[>", function()
	if not _G.terminal_stack or vim.tbl_isempty(_G.terminal_stack) then
		return
	end

	-- Build sorted list of terminal counts
	local counts = {}
	for count, term in pairs(_G.terminal_stack) do
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			table.insert(counts, count)
		end
	end
	table.sort(counts)

	if #counts <= 1 then
		return
	end

	-- Find current terminal
	local current_buf = vim.api.nvim_get_current_buf()
	local current_count = nil
	for _, count in ipairs(counts) do
		if _G.terminal_stack[count].buf == current_buf then
			current_count = count
			break
		end
	end

	if current_count then
		-- Find previous count
		local current_idx = vim.tbl_contains(counts, current_count) and vim.fn.index(counts, current_count) + 1 or 1
		local prev_idx = current_idx - 1
		if prev_idx < 1 then
			prev_idx = #counts
		end
		switch_terminal(counts[prev_idx])
	end
end, { desc = "Previous Terminal" })

-- Quit group
keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit Window" })
keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit All" })
keymap.set("n", "<leader>qQ", "<cmd>q!<CR>", { desc = "Quit Without Saving" })

-- UI Toggles (Alt key for quick access, work in any mode)
keymap.set({ "n", "i", "v", "t" }, "<A-z>", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })

keymap.set({ "n", "i", "v", "t" }, "<A-f>", function()
	-- Check if grug-far buffer exists
	local grug_buf_exists = false
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].filetype == "grug-far" then
			grug_buf_exists = true
			break
		end
	end

	-- If no grug-far buffer exists, open it first
	if not grug_buf_exists then
		local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
		require("grug-far").open({
			transient = true,
			prefills = {
				filesFilter = ext and ext ~= "" and "*." .. ext or nil,
			},
		})
	else
		-- Toggle the left panel (where grug-far lives)
		require("edgy").toggle("left")
	end
end, { desc = "Toggle Find and Replace" })

-- Search highlight groups with Snacks picker
keymap.set("n", "<leader>fH", function()
	Snacks.picker.highlights()
end, { desc = "Find Highlight Groups" })
