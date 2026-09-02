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

      pcall(vim.keymap.del, "n", "gra")
      pcall(vim.keymap.del, "x", "gra")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
        callback = function(event)
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
          end
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map({ "n", "x" }, "<leader>cq", function()
            vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true })
          end, "Quickfix")
          map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>cs", vim.lsp.buf.document_symbol, "Document symbols")
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
