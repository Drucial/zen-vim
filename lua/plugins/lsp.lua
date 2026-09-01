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
      -- Not Mason-installable: ruby-lsp comes from the bundle, sourcekit-lsp
      -- from the Swift toolchain.
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
