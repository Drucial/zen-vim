return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>sa", "<Plug>(nvim-surround-normal)", desc = "Surround motion" },
    { "<leader>sA", "<Plug>(nvim-surround-normal-cur)", desc = "Surround line" },
    { "<leader>sl", "<Plug>(nvim-surround-normal-line)", desc = "Surround motion on new lines" },
    { "<leader>sL", "<Plug>(nvim-surround-normal-cur-line)", desc = "Surround line on new lines" },
    { "<leader>ss", "<Plug>(nvim-surround-visual)", mode = "x", desc = "Surround selection" },
    { "<leader>sS", "<Plug>(nvim-surround-visual-line)", mode = "x", desc = "Surround selection on new lines" },
    { "<leader>sd", "<Plug>(nvim-surround-delete)", desc = "Delete surround" },
    { "<leader>sc", "<Plug>(nvim-surround-change)", desc = "Change surround" },
    { "<leader>sC", "<Plug>(nvim-surround-change-line)", desc = "Change surround on new lines" },
  },
}
