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
        -- keys = {
        --   {
        --     icon = " ",
        --     key = "f",
        --     desc = "Find File",
        --     action = ":lua Snacks.dashboard.pick('files')",
        --   },
        --   { icon = "", key = "y", desc = "File Browser", action = "<CMD>Oil<CR>" },
        --   { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        --   {
        --     icon = " ",
        --     key = "g",
        --     desc = "Find Text",
        --     action = ":lua Snacks.dashboard.pick('live_grep')",
        --   },
        --   {
        --     icon = " ",
        --     key = "r",
        --     desc = "Recent Files",
        --     action = ":lua Snacks.dashboard.pick('oldfiles')",
        --   },
        --   {
        --     icon = " ",
        --     key = "c",
        --     desc = "Config",
        --     action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
        --   },
        --   { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        --   -- { icon = ' ', key = 'x', desc = 'Lazy Extras', action = ':LazyExtras' },
        --   { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        --   { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        -- },
      },
    },
    picker = {
      ui_select = true,
      sources = {
        files = { hidden = true, ignored = true, exclude = exclude },
        grep = { hidden = true, ignored = true, exclude = exclude },
      },
    },
  },
}
