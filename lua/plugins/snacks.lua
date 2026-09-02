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
      indent = { enabled = false },
      scope = { enabled = true },
      only_scope = true, -- only show indent guides of the scope
      only_current = true, -- only show indent guides in the current window
    },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = {
      ui_select = true,
      sources = {
        files = { hidden = true, ignored = true, exclude = exclude },
        grep = { hidden = true, ignored = true, exclude = exclude },
      },
    },
    zen = {
      enabled = true,
      -- Values are the desired state, not "hide". Only ids backed by a
      -- Snacks.toggle.<id> constructor resolve; git_signs is not one of them.
      toggles = {
        dim = false,
        diagnostics = true,
        inlay_hints = true,
      },
      show = {
        statusline = false,
        tabline = false,
      },
      -- Line numbers stay on: mini.diff renders hunks by tinting them.
      win = {
        width = 110,
        height = 0,
      },
    },
  },
}
