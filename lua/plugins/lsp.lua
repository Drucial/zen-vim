return {
  -- Mason: Package manager for LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  -- Mason-LSPConfig: Bridges mason.nvim with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- List of servers to automatically install
      ensure_installed = {
        "lua_ls",        -- Lua (for Neovim config)
        "ts_ls",         -- TypeScript/JavaScript
        "eslint",        -- ESLint for TS/JS linting
        "ruby_lsp",      -- Ruby (Rails)
        "pyright",       -- Python
        "bashls",        -- Bash scripts
        "tailwindcss",   -- Tailwind CSS
      },
      -- Automatically enable installed servers (default: true)
      automatic_enable = true,
    },
  },

  -- LSPConfig: Configurations for LSP servers
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- LSP Keybindings (set when LSP attaches to buffer)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Jump to definition/declaration
          map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("gr", require("telescope.builtin").lsp_references, "Goto References")
          map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
          map("gy", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

          -- Documentation and signatures
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gK", vim.lsp.buf.signature_help, "Signature Help")

          -- Code actions
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")

          -- Diagnostics
          map("<leader>q", vim.diagnostic.setloclist, "Quickfix Diagnostics")
          map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous Diagnostic")
          map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next Diagnostic")
          map("<leader>e", vim.diagnostic.open_float, "Show Diagnostic")

          -- Workspace management
          map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
          map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
          map("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, "Workspace List Folders")

          -- Highlight references under cursor
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Configure individual LSP servers using modern API
      -- Note: mason-lspconfig automatically enables these servers via automatic_enable

      -- Lua Language Server (for Neovim config)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- TypeScript/JavaScript
      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      -- ESLint
      vim.lsp.config("eslint", {})

      -- Ruby (Rails)
      vim.lsp.config("ruby_lsp", {})

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      })

      -- Bash
      vim.lsp.config("bashls", {})

      -- Tailwind CSS
      vim.lsp.config("tailwindcss", {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "tw`([^`]*)",
                'tw="([^"]*)',
                'tw={"([^"}]*)',
                "tw\\.\\w+`([^`]*)",
                "tw\\(.*?\\)`([^`]*)",
              },
            },
          },
        },
      })
    end,
  },
}
