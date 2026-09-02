local exclude = {
  ".git",
  ".jj",
  "node_modules",
  "vendor",
  "dist",
  "build",
  ".build",
  "out",
  "target",
  "DerivedData",
  ".next",
  ".nuxt",
  ".turbo",
  ".cache",
  "coverage",
  ".venv",
  "__pycache__",
  "tmp",
  "log",
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      ui_select = true,
      sources = {
        files = { hidden = true, ignored = true, exclude = exclude },
        grep = { hidden = true, ignored = true, exclude = exclude },
      },
    },
  },
}
