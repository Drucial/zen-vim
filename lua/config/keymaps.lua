local map = vim.keymap.set

-- Buffer Management
map("n", "<leader>bn", ":bnext<CR>", { desc = "Cycle to next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Cycle to previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<CR>", { desc = "Delete buffer (force)" })

-- Window Management
map("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>w_", "<cmd>split<CR>", { desc = "Split window horizontally" })
