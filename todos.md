# Neovim Configuration TODO

## Completed ✓

### Initial Setup
- [x] Set up lazy.nvim plugin manager
- [x] Create modular configuration structure (opts, keybinds, lazy, autocmds)
- [x] Set leader keys (Space for both leader and local leader)
- [x] Align vim options with kickstart.nvim standards
- [x] Set up rose-pine colorscheme

### Keybindings
- [x] Configure window management keybinds
- [x] Configure tab management keybinds
- [x] Add Option+Shift+Arrow for moving lines up/down
- [x] Add centered scrolling (Ctrl+d/u and Ctrl+Arrow)
- [x] Add Esc for clearing search highlights
- [x] Add Esc+Esc for exiting terminal mode
- [x] Remove conflicting navigation keys for vim-kitty-navigator

### Plugins - Navigation & UI
- [x] Install vim-kitty-navigator for seamless kitty/nvim navigation
- [x] Install oil.nvim for file exploration
- [x] Install telescope.nvim for fuzzy finding
- [x] Install nvim-scrollbar for diagnostic visualization
- [x] Configure telescope keybindings (<leader>f prefix)

### Plugins - LSP & Code Intelligence
- [x] Install mason.nvim for LSP server management
- [x] Install mason-lspconfig.nvim for automatic LSP setup
- [x] Install nvim-lspconfig with modern vim.lsp.config() API
- [x] Configure language servers for:
  - [x] TypeScript/JavaScript (ts_ls)
  - [x] ESLint (eslint)
  - [x] Ruby/Rails (ruby_lsp)
  - [x] Python (pyright)
  - [x] Bash (bashls)
  - [x] Tailwind CSS (tailwindcss)
  - [x] Lua (lua_ls)
- [x] Set up comprehensive LSP keybindings
- [x] Configure document highlighting on cursor hold
- [x] Update to modern diagnostic navigation (vim.diagnostic.jump)

### Plugins - Formatting & Linting
- [x] Install conform.nvim for autoformatting
- [x] Install mason-tool-installer for formatter management
- [x] Configure format on save for all languages
- [x] Set up ESLint auto-fix for TypeScript/JavaScript
- [x] Configure formatters:
  - [x] Prettier (TS/JS/CSS/HTML/JSON/YAML/Markdown)
  - [x] eslint_d (TS/JS auto-fix)
  - [x] Stylua (Lua)
  - [x] Black + isort (Python)
  - [x] Rubocop (Ruby)
  - [x] shfmt (Bash)

### Documentation
- [x] Create comprehensive CLAUDE.md
- [x] Document all keybindings
- [x] Document plugin architecture
- [x] Document configuration load order

## In Progress 🚧

None currently

## Todo 📋

### Future Enhancements
- [ ] Add completion engine (nvim-cmp)
- [ ] Add snippets support
- [ ] Add treesitter for better syntax highlighting
- [ ] Add git integration (gitsigns)
- [ ] Add status line (lualine)
- [ ] Add buffer line/tab line
- [ ] Add which-key configuration for keybinding discovery
- [ ] Add debugging support (nvim-dap)
- [ ] Add testing integration
- [ ] Consider adding copilot or other AI assistance

### Kitty Terminal Integration
- [ ] Document kitty.conf requirements for vim-kitty-navigator
- [ ] Resolve Option key binding issues in Kitty

## Notes

### Known Issues
- Option+Arrow keys don't work in Kitty without additional terminal configuration
- Currently using Option+Shift+Arrow as workaround for line movement

### Configuration Philosophy
- Use modern Neovim 0.11+ APIs (vim.lsp.config, vim.diagnostic.jump)
- Keep configuration modular and maintainable
- Align with kickstart.nvim best practices
- Auto-install all dependencies via Mason
- Format on save by default (toggleable)
