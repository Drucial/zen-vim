return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = "InsertEnter",
  opts = {
    keymap = { preset = "default" },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = false },
      },
      menu = { auto_show = true, border = "rounded" },
      documentation = { auto_show = false, window = { border = "rounded" } },
      ghost_text = { enabled = false },
    },
    signature = { window = { border = "rounded" } },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
}
