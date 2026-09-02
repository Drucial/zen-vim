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
        "html",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { disable = { "missing-fields" } } } },
      })
      vim.lsp.config("vtsls", {
        settings = {
          vtsls = { autoUseWorkspaceTsdk = true },
          typescript = { tsserver = { maxTsServerMemory = 8192 } },
        },
      })
      vim.lsp.config("ruby_lsp", { cmd = { "bundle", "exec", "ruby-lsp" } })
      vim.lsp.enable({ "ruby_lsp", "sourcekit" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
        callback = function(event)
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
          end
          -- The built-in gr* maps route multi-result locations to a quickfix
          -- window and take no option to redirect it, so they are rebound here.
          map("n", "gd", function()
            Snacks.picker.lsp_definitions()
          end, "Go to definition")
          map("n", "gD", function()
            Snacks.picker.lsp_declarations()
          end, "Go to declaration")
          map("n", "grr", function()
            Snacks.picker.lsp_references()
          end, "References")
          map("n", "gri", function()
            Snacks.picker.lsp_implementations()
          end, "Implementations")
          map("n", "grt", function()
            Snacks.picker.lsp_type_definitions()
          end, "Type definitions")
          map({ "n", "x" }, "<leader>cA", function()
            vim.lsp.buf.code_action({ context = { only = { "source" } } })
          end, "Source actions")
          map({ "n", "x" }, "<leader>cq", function()
            vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true })
          end, "Quickfix")
          map("n", "gO", function()
            Snacks.picker.lsp_symbols()
          end, "Document symbols")
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
        "tree-sitter-cli",
      },
    },
  },
}
