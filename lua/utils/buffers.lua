-- Custom buffer management utilities
-- Window-local buffer management: buffers act like tabs per window
local M = {}

--- Track buffer history per window
--- Structure: { [win_id] = { buf1, buf2, buf3, ... } }
local window_buffer_history = {}

--- Add buffer to window history
local function track_buffer(win_id, buf_id)
	if not window_buffer_history[win_id] then
		window_buffer_history[win_id] = {}
	end

	local history = window_buffer_history[win_id]

	-- Remove buffer if it already exists in history
	for i, b in ipairs(history) do
		if b == buf_id then
			table.remove(history, i)
			break
		end
	end

	-- Add buffer to end of history (most recent)
	table.insert(history, buf_id)
end

--- Get previous buffer from window history
local function get_previous_buffer_in_window(win_id, current_buf)
	local history = window_buffer_history[win_id]
	if not history or #history == 0 then
		return nil
	end

	-- Walk backwards through history to find a valid buffer
	for i = #history, 1, -1 do
		local buf_id = history[i]
		-- Skip current buffer and check if buffer is still valid
		if buf_id ~= current_buf and vim.api.nvim_buf_is_valid(buf_id) then
			return buf_id
		end
	end

	return nil
end

--- Clean up history for closed windows
local function cleanup_window_history()
	for win_id, _ in pairs(window_buffer_history) do
		if not vim.api.nvim_win_is_valid(win_id) then
			window_buffer_history[win_id] = nil
		end
	end
end

--- Delete buffer with window-local awareness
--- Never duplicates buffers across windows, shows dashboard when no history exists
M.delete = function()
	local current_win = vim.api.nvim_get_current_win()
	local current_buf = vim.api.nvim_get_current_buf()
	local wins_showing_buf = vim.fn.win_findbuf(current_buf)

	-- If multiple windows show this buffer, just switch current window (don't delete buffer)
	if #wins_showing_buf > 1 then
		local prev_buf = get_previous_buffer_in_window(current_win, current_buf)
		if prev_buf then
			vim.api.nvim_win_set_buf(current_win, prev_buf)
		else
			-- No history in this window, create new scratch buffer and show dashboard in it
			local new_buf = vim.api.nvim_create_buf(true, false)
			vim.api.nvim_win_set_buf(current_win, new_buf)
			Snacks.dashboard({ win = current_win, buf = new_buf })
		end
		-- Don't delete buffer since other windows are using it
		return
	end

	-- Only this window shows the buffer - safe to delete
	local prev_buf = get_previous_buffer_in_window(current_win, current_buf)

	if prev_buf then
		-- Switch to previous buffer in this window's history
		vim.api.nvim_win_set_buf(current_win, prev_buf)
	else
		-- No history in this window, create new scratch buffer and show dashboard in it
		local new_buf = vim.api.nvim_create_buf(true, false)
		vim.api.nvim_win_set_buf(current_win, new_buf)
		Snacks.dashboard({ win = current_win, buf = new_buf })
	end

	-- Now delete the original buffer (we've already switched away from it)
	pcall(vim.api.nvim_buf_delete, current_buf, { force = false })

	-- Clean up history
	cleanup_window_history()
end

--- Setup autocmd to track buffer changes
M.setup = function()
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		callback = function(ev)
			local win_id = vim.api.nvim_get_current_win()
			local buf_id = ev.buf

			-- Don't track certain buffer types
			local buftype = vim.bo[buf_id].buftype
			local filetype = vim.bo[buf_id].filetype

			-- Skip terminals, dashboards, and special buffers
			if buftype == "" or (buftype == "terminal") then
				if filetype ~= "snacks_dashboard" then
					track_buffer(win_id, buf_id)
				end
			end
		end,
	})
end

-- Initialize tracking
M.setup()

return M
