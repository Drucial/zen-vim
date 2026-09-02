return {
  "gbprod/yanky.nvim",
  event = "BufReadPost",
  opts = {
    highlight = { timer = 150 },
  },
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after, cursor after" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before, cursor after" },
    { "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Previous yank" },
    { "<C-n>", "<Plug>(YankyNextEntry)", desc = "Next yank" },
  },
}
