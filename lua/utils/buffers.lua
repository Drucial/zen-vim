-- Custom buffer management utilities
local M = {}

--- Delete buffer with window-aware logic
--- Prevents pulling buffers from other windows and handles terminal duplication
M.delete = function()
	-- Get current buffer
	local buf = vim.api.nvim_get_current_buf()
	local bufname = vim.api.nvim_buf_get_name(buf)
	local wins = vim.fn.win_findbuf(buf)
	local win_count = #wins

	-- If multiple windows show this buffer, just switch current window to empty buffer
	if win_count > 1 then
		vim.cmd("enew")
		return
	end

	-- Single window case
	local alt_buf = vim.fn.bufnr("#")
	local has_alt = alt_buf ~= -1 and alt_buf ~= buf and vim.fn.buflisted(alt_buf) == 1

	if not has_alt and bufname ~= "" then
		vim.cmd("enew")
		require("mini.bufremove").delete(buf, false)
	else
		require("mini.bufremove").delete(buf, false)
	end
end

return M
