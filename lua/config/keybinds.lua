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
keymap.set("n", "<leader>w", "", { desc = "+windows" })

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
	require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy Plugin Manager" })
keymap.set("n", "<leader>n", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })

-- Terminal
keymap.set({ "n", "t" }, "<leader>\\", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })

-- Quit group
keymap.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit Window" })
keymap.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit All" })
keymap.set("n", "<leader>qQ", "<cmd>q!<CR>", { desc = "Quit Without Saving" })

-- Search highlight groups with Snacks picker
keymap.set("n", "<leader>fH", function()
	Snacks.picker.highlights()
end, { desc = "Find Highlight Groups" })
