-- Terminal management utilities for VSCode-style stacking behavior
local M = {}

-- Global state for terminal stack
_G.terminal_stack = _G.terminal_stack or {}
_G.terminal_current_index = _G.terminal_current_index or 1

-- Get list of valid terminals in order
function M.get_valid_terminals()
	local valid = {}
	for i, term in ipairs(_G.terminal_stack) do
		if term and term.buf and vim.api.nvim_buf_is_valid(term.buf) then
			table.insert(valid, { index = i, term = term })
		end
	end
	return valid
end

-- Show specific terminal by index (with wrapping)
function M.show_terminal(index)
	-- Get valid terminals first
	local valid = M.get_valid_terminals()
	if #valid == 0 then
		return false
	end

	-- Clamp index to valid range (with wrapping)
	if index < 1 then
		index = #valid
	elseif index > #valid then
		index = 1
	end

	-- Hide ALL terminals first
	for _, entry in ipairs(valid) do
		if entry.term.win and vim.api.nvim_win_is_valid(entry.term.win) then
			entry.term:hide()
		end
	end

	-- Also hide any other terminals from Snacks.terminal.list()
	local all_terminals = Snacks.terminal.list()
	for _, term in ipairs(all_terminals) do
		if term:valid() and term.win and vim.api.nvim_win_is_valid(term.win) then
			term:hide()
		end
	end

	-- Now show the target terminal
	_G.terminal_current_index = index
	local term = valid[index].term
	term:show()
	return true
end

-- Toggle terminal panel visibility (show/hide)
function M.toggle_terminal_panel()
	-- Check if any terminal is visible
	local any_visible = false
	local all_terminals = Snacks.terminal.list()
	for _, term in ipairs(all_terminals) do
		if term:valid() and vim.api.nvim_win_is_valid(term.win) then
			any_visible = true
			break
		end
	end

	if any_visible then
		-- Hide all terminals
		for _, term in ipairs(all_terminals) do
			if term:valid() and vim.api.nvim_win_is_valid(term.win) then
				term:hide()
			end
		end
	else
		-- Show last active terminal (or create first one)
		local valid = M.get_valid_terminals()
		if #valid == 0 then
			-- Create first terminal with count = 1
			local term = Snacks.terminal.get(nil, {
				count = 1,
				win = {
					position = "right",
					width = 0.30,
					stack = true,
				},
			})
			table.insert(_G.terminal_stack, term)
			_G.terminal_current_index = 1
			-- Make sure it shows up
			if not term.win or not vim.api.nvim_win_is_valid(term.win) then
				term:show()
			end
		else
			-- Show the last active terminal
			M.show_terminal(_G.terminal_current_index)
		end
	end
end

-- Create new terminal in stack
function M.create_new_terminal()
	-- Hide all visible terminals first
	local all_terminals = Snacks.terminal.list()
	for _, term in ipairs(all_terminals) do
		if term:valid() and vim.api.nvim_win_is_valid(term.win) then
			term:hide()
		end
	end

	-- Create new terminal with unique count to ensure proper stacking
	local new_index = #_G.terminal_stack + 1
	local term = Snacks.terminal.get(nil, {
		count = new_index,
		win = {
			position = "right",
			width = 0.30,
			stack = true,
		},
	})
	table.insert(_G.terminal_stack, term)
	_G.terminal_current_index = new_index

	-- Make sure it shows up
	if not term.win or not vim.api.nvim_win_is_valid(term.win) then
		term:show()
	end
end

-- Cycle to next terminal
function M.next_terminal()
	local valid = M.get_valid_terminals()
	if #valid <= 1 then
		return
	end
	M.show_terminal(_G.terminal_current_index + 1)
end

-- Cycle to previous terminal
function M.prev_terminal()
	local valid = M.get_valid_terminals()
	if #valid <= 1 then
		return
	end
	M.show_terminal(_G.terminal_current_index - 1)
end

-- Show terminal picker
function M.pick_terminal()
	local valid = M.get_valid_terminals()
	if #valid == 0 then
		vim.notify("No terminals open", vim.log.levels.INFO)
		return
	end

	local items = {}
	for _, entry in ipairs(valid) do
		local term = entry.term
		local buf = term.buf
		local term_info = vim.b[buf].snacks_terminal or {}
		local cwd = term_info.cwd or vim.fn.getcwd()
		-- Get just the directory name (last component of path)
		local dir_name = vim.fn.fnamemodify(cwd, ":t")

		table.insert(items, {
			text = dir_name,
			index = entry.index,
		})
	end

	vim.ui.select(items, {
		prompt = "Select Terminal:",
		format_item = function(item)
			return item.text
		end,
	}, function(choice)
		if choice then
			-- Find the position of this terminal in valid list
			for i, entry in ipairs(valid) do
				if entry.index == choice.index then
					M.show_terminal(i)
					break
				end
			end
		end
	end)
end

return M
