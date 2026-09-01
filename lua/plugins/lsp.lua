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

      vim.lsp.config("ruby_lsp", { cmd = { "bundle", "exec", "ruby-lsp" } })
      vim.lsp.enable({ "ruby_lsp", "sourcekit" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
        callback = function(event)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
        end,
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
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
