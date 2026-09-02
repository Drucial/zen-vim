return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "diagnostics" },
      { "<leader>f", group = "find" },
      { "<leader>w", group = "window" },
    },
  },
}
