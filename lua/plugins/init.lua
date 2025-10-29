return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "b0o/schemastore.nvim", lazy = true }, -- JSON schemas for better completion
  { "nvim-tree/nvim-web-devicons", lazy = true }, -- Fallback icons for plugins that don't support mini.icons

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "knubie/vim-kitty-navigator" }
}
