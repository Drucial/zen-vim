local map = vim.keymap.set

-- Buffer Management
map("n", "<leader>bn", ":bnext<CR>", { desc = "Cycle to next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Cycle to previous buffer" })
