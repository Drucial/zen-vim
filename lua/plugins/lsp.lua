return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "vtsls",
        "eslint",
        "tailwindcss",
        "gopls",
        "bashls",
        "jsonls",
        "yamlls",
        "marksman",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- Ruby tooling is Gemfile-pinned (rubocop ~> 1.88 plus rails/capybara/
      -- performance plugins), so the server must come from the bundle. This has
      -- to go through vim.lsp.config rather than an lsp/ruby_lsp.lua file:
      -- runtimepath configs merge last-wins, and nvim-lspconfig's copy sorts
      -- after ours.
      vim.lsp.config("ruby_lsp", { cmd = { "bundle", "exec", "ruby-lsp" } })

      -- Not Mason-installable: ruby-lsp from the bundle, sourcekit-lsp from the
      -- Swift toolchain.
      vim.lsp.enable({ "ruby_lsp", "sourcekit" })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Fallback only: conform prefers a project's node_modules/.bin/prettier
        -- so repo-local plugins (tailwind, organize-imports) still apply.
        "prettier",
        "stylua",
        "shfmt",
        "shellcheck",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "swiftlint",
      },
    },
  },
}
