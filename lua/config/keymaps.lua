local map = vim.keymap.set

-- Config
map("n", "<leader>R", "<cmd>restart<CR>", { desc = "Reload Nvim" })

-- Buffer Management
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<CR>", { desc = "Delete buffer (force)" })

-- Code
map({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

-- Find
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Files" })
map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })
map({ "n", "x" }, "<leader>fw", function()
  Snacks.picker.grep_word()
end, { desc = "Grep word under cursor" })
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent files" })
map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Help pages" })
map("n", "<leader>fk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>fR", function()
  Snacks.picker.resume()
end, { desc = "Resume last picker" })

-- Diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>db", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer diagnostics" })
map("n", "<leader>dw", function()
  Snacks.picker.diagnostics()
end, { desc = "Workspace diagnostics" })
map("n", "<leader>de", function()
  vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = "Next error" })
map("n", "<leader>dE", function()
  vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = true })
end, { desc = "Previous error" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
map("n", "<leader>dt", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
