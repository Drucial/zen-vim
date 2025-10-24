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

### Plugins - Treesitter & Code Understanding

- [x] Install nvim-treesitter for better syntax highlighting
- [x] Configure treesitter for all languages (TS, Ruby, Python, Lua, etc.)
- [x] Set up incremental selection (Ctrl+Space)
- [x] Configure treesitter textobjects (af, if, ac, ic, aa, ia)
- [x] Add navigation for functions and classes ([f, ]f, [c, ]c)

### Plugins - Which-Key

- [x] Install and configure which-key.nvim
- [x] Set up keybinding groups (find, buffer, code, split)
- [x] Configure helix preset for clean vertical layout
- [x] Remove duplicative keybindings

### Keybinding Refinements

- [x] Reorganize all code commands under <leader>c
  - [x] Move format from <leader>f to <leader>cf
  - [x] Add <leader>ci for code info (hover documentation)
  - [x] Move rename from <leader>rn to <leader>cr
  - [x] Move diagnostics from <leader>e to <leader>cd
- [x] Change <leader>fg to <leader>fs (Find String)
- [x] Remove tab management (use buffers instead)
- [x] Organize buffer commands under <leader>b

### LSP Expansion

- [x] Add Prisma language server (prismals)
- [x] Add Markdown language server (marksman)
- [x] Add JSON language server (jsonls)
- [x] Add HTML language server (html)
- [x] Add CSS language server (cssls)

### Recent Session Improvements

- [x] Configure custom lualine statusline with breadcrumb navigation
- [x] Add rose-pine color palette integration to lualine
- [x] Create git.lua plugin file (gitsigns + lazygit)
- [x] Create trouble.lua for better diagnostics display
- [x] Create telescope.lua (moved from ui.lua)
- [x] Add project picker with eza tree preview (<leader>fp)
- [x] Add config file picker (<leader>fc)
- [x] Update which-key groups (git, diagnostics)
- [x] Add snacks.nvim dashboard with custom keybindings
- [x] Remove tilde characters on empty lines
- [x] Add mini.nvim suite (pairs, surround, comment, bufremove, icons)
- [x] Add GitHub Copilot with ghost text and smart Tab acceptance

## In Progress 🚧

None currently

## Todo 📋

### Required Enhancements

- [x] Add status line (lualine)
- [x] Add git integration (gitsigns)
- [x] Add trouble plugin for diagnostics
- [x] Add lazygit integration
- [x] Add snacks.nvim dashboard
- [x] Copilot with ghost text and smart Tab completion
- [ ] Add completion engine (nvim-cmp or ???)

### Possible Enhacments

- [ ] Add debugging support (nvim-dap)
- [ ] Add snippets support
- [ ] Add testing integration

### Cleanup & Maintenance

- [ ] Clean up visible shortcuts (which-key display options)
- [ ] Fix dashboard ASCII art formatting
- [ ] Replace telescope with snacks picker (including project picker with eza preview)

### Kitty Terminal Integration

- [ ] Document kitty.conf requirements for vim-kitty-navigator
- [ ] Resolve Option key binding issues in Kitty

## Notes

### Known Issues

- Option+Arrow keys don't work in Kitty without additional terminal configuration
- Currently using Option+Shift+Arrow as workaround for line movement

### Maintenance Notes

- **Mason cleanup needed**: Uninstall vtsls (conflicts with ts_ls) and other unused LSP servers
  - Keep: ts_ls, eslint, ruby_lsp, pyright, bashls, tailwindcss, prismals, marksman, jsonls, html, cssls, lua_ls
  - Remove: vtsls, gopls, rust-analyzer, and other unused servers

### Configuration Philosophy

- Use modern Neovim 0.11+ APIs (vim.lsp.config, vim.diagnostic.jump)
- Keep configuration modular and maintainable
- Align with kickstart.nvim best practices
- Auto-install all dependencies via Mason
- Format on save by default (toggleable)
