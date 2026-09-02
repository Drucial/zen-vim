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
    dashboard = {
      enabled = true,
      preset = {
        --styula:ignore start
        header = [[
┏┓┏┓┳┓┓┏┳┳┳┓
┏┛┣ ┃┃┃┃┃┃┃┃
┗┛┗┛┛┗┗┛┻┛ ┗

01011010 01000101 01001110 01010110 01001001 01001101
]],
        -- styula:ignore end
      },
    },
    indent = {
      enabled = true,
      only_scope = true, -- only show indent guides of the scope
      only_current = true, -- only show indent guides in the current window
    },
    picker = {
      ui_select = true,
      sources = {
        files = { hidden = true, ignored = true, exclude = exclude },
        grep = { hidden = true, ignored = true, exclude = exclude },
      },
    },
    zen = {
      enabled = true,
      toggles = {
        dim = false, -- don't dim inactive windows
        git_signs = true, -- hide git signs
        diagnostics = true, -- hide diagnostics
        inlay_hints = true, -- hide inlay hints
      },
      show = {
        statusline = false, -- hide statusline
        tabline = false, -- hide tabline
      },
      win = {
        width = 110, -- width in columns (or use 0.8 for 80% of screen)
        height = 0, -- 0 = full height
      },
      on_open = function()
        -- Save current line number settings
        vim.b.zen_number = vim.wo.number
        vim.b.zen_relativenumber = vim.wo.relativenumber
        -- Disable line numbers
        vim.wo.number = false
        vim.wo.relativenumber = false
      end,
      on_close = function()
        -- Restore line number settings
        vim.wo.number = vim.b.zen_number
        vim.wo.relativenumber = vim.b.zen_relativenumber
      end,
    },
  },
}
