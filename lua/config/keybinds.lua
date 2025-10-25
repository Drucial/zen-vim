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

-- Window management
keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below" })
keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right" })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other Window" })
keymap.set("n", "<leader>w=", "<C-W>=", { desc = "Balance Windows" })

-- Window resize
keymap.set("n", "<leader>wh", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<leader>wl", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
keymap.set("n", "<leader>wk", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<leader>wj", "<cmd>resize -2<CR>", { desc = "Decrease window height" })

-- UI toggles
keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })

-- Terminal (using <A-\> for quick access)
keymap.set({ "n", "t" }, "<A-\\>", function()
	Snacks.terminal()
end, { desc = "Toggle Terminal" })

-- Search highlight groups with Snacks picker
keymap.set("n", "<leader>fH", function()
	Snacks.picker.highlights()
end, { desc = "Find Highlight Groups" })
