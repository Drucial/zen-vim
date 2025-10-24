# Neovim Configuration Roadmap

## Overview

This roadmap tracks the development and evolution of this Neovim configuration. The goal is to create a modern, performant, and maintainable setup that follows Neovim 0.11+ best practices while maintaining alignment with kickstart.nvim principles.

## Configuration Philosophy

- **Modern APIs First**: Use Neovim 0.11+ APIs (vim.lsp.config, vim.diagnostic.jump)
- **Modular Architecture**: Keep configuration files focused and maintainable
- **Lazy Loading**: Optimize startup time through strategic plugin lazy-loading
- **Auto-Installation**: All dependencies installed automatically via Mason
- **Format on Save**: Enabled by default with per-buffer toggle support

---

## Completed Features

### Core Infrastructure

#### Plugin Management & Architecture
- Lazy.nvim plugin manager with lazy loading strategies
- Modular configuration structure (opts, keybinds, lazy, autocmds)
- Leader keys properly set before plugin initialization
- Comprehensive CLAUDE.md documentation for AI assistance
- Configuration load order: init → lazy → opts → autocmds → keybinds

#### Navigation & UI
- **vim-kitty-navigator**: Seamless navigation between Kitty terminal and Neovim
- **oil.nvim**: File explorer with hidden files enabled
- **snacks.nvim**: Modern picker (fuzzy finder), dashboard, and bigfile handling
- **nvim-scrollbar**: Visual feedback for diagnostics, search, and cursor position
- **lualine.nvim**: Custom statusline with breadcrumb navigation and rose-pine integration
- **which-key.nvim**: Interactive keybinding discovery with helix preset

#### Visual & Theme
- **rose-pine**: Color scheme (rose-pine-moon variant)
- **mini.icons**: Icon support replacing nvim-web-devicons
- **dressing.nvim**: Enhanced UI for inputs and selections
- **nvim-notify**: Beautiful notifications
- **noice.nvim**: Enhanced UI for messages, cmdline, and popupmenu with LSP doc scrolling
- Removed tilde characters on empty lines

#### Editor Enhancements
- **mini.pairs**: Auto-pair brackets and quotes
- **mini.surround**: Surround text objects with ease
- **mini.comment**: Smart commenting
- **mini.bufremove**: Better buffer deletion
- **flash.nvim**: Quick navigation with search labels
- **grug-far.nvim**: Search and replace across files
- **todo-comments.nvim**: Highlight and navigate TODO/FIXME/NOTE comments

### Language Support

#### LSP Infrastructure
- **mason.nvim**: LSP server, formatter, and linter manager
- **mason-lspconfig.nvim**: Automatic LSP server setup
- **nvim-lspconfig**: Modern vim.lsp.config() API
- Document highlighting on cursor hold
- Modern diagnostic navigation (vim.diagnostic.jump)
- Comprehensive LSP keybindings under `<leader>c` prefix

#### Language Servers (12 configured)
- **lua_ls**: Lua (Neovim configuration)
- **ts_ls**: TypeScript/JavaScript with inlay hints
- **eslint**: ESLint linting for TS/JS
- **ruby_lsp**: Ruby and Rails
- **pyright**: Python with workspace analysis
- **bashls**: Bash scripts
- **tailwindcss**: Tailwind CSS with custom class regex
- **prismals**: Prisma schema files
- **marksman**: Markdown
- **jsonls**: JSON
- **html**: HTML
- **cssls**: CSS

#### Formatting & Linting
- **conform.nvim**: Fast async formatting with format-on-save
- **mason-tool-installer.nvim**: Auto-install formatters
- **Formatters**: prettier, eslint_d, stylua, black, isort, rubocop, shfmt
- Format on save toggle (global and per-buffer)

#### Treesitter
- **nvim-treesitter**: Advanced syntax highlighting (opts pattern)
- **nvim-treesitter-textobjects**: Treesitter-based text objects
- **nvim-ts-autotag**: Auto-close and rename HTML/JSX/XML tags
- Incremental selection with `<C-space>`
- Smart indentation (delegated to LSP for Ruby/Python)
- Textobjects: functions, classes, parameters
- Navigation: jump between functions and classes
- 20+ parsers auto-installed

### Developer Experience

#### Completion & AI
- **blink.cmp**: Modern, high-performance completion (<4ms updates)
- **blink-cmp-copilot**: GitHub Copilot integration for blink.cmp
- **copilot.lua**: GitHub Copilot backend with ghost text and smart Tab acceptance
- Smart completion sources: Copilot → LSP → Path → Snippets → Buffer

#### Git Integration
- **gitsigns.nvim**: Git signs in gutter with LazyVim-style keybindings
- **lazygit.nvim**: Full Git UI integration (`<leader>gg`)
- Hunk navigation and staging (`]h`, `[h`, `<leader>gh` prefix)
- Git branch and diff info in lualine

#### Diagnostics
- **trouble.nvim**: Better diagnostics display
- Diagnostic markers in scrollbar
- Quick diagnostic navigation (`[d`, `]d`)

### Keybinding Organization

All keybindings organized into logical groups:
- **`<leader>f`**: Find operations (picker)
- **`<leader>s`**: Search operations (grep, todo, replace)
- **`<leader>w`**: Window management
- **`<leader>b`**: Buffer operations
- **`<leader>c`**: Code actions (format, rename, diagnostics, hover)
- **`<leader>g`**: Git operations
- **`<leader>gh`**: Git hunks
- **`<leader>sn`**: Noice notifications

Removed tab management in favor of buffer-based workflow.

---

## Current Status

### Production Ready
All essential features are implemented and stable. The configuration is ready for daily use with:
- Full LSP support for 12 languages
- Modern completion with AI assistance
- Comprehensive formatting and linting
- Rich git integration
- Intuitive keybindings with discovery

### Recently Completed
- **Zen Mode**: Distraction-free coding with `<leader>z` (`lua/plugins/ui.lua:166-196`)
  - Hides line numbers, statusline, diagnostics, git signs
  - Centers window (120 columns)
  - Auto-restores settings on exit

- **Close buffers back to dashboard**: IDE-like buffer management (`lua/config/autocmds.lua:72-142`)
  - Closing last buffer returns to snacks dashboard instead of empty buffer
  - Uses mini.bufremove for clean buffer deletion (`lua/plugins/picker.lua:126-132`)
  - Automatically detects when no "real" buffers remain
  - Ignores special buffers (dashboard, oil, trouble, help, lazy, mason, etc.)
  - Handles edge cases with Oil and dashboard integration
  - Debug statements preserved as comments for future troubleshooting

---

## In Progress

### Panel & Layout Improvements
Visual and functional improvements to editor panels:

1. **Grug-far panel improvements** (`lua/plugins/code.lua:88-112`)
   - Current issues: Basic styling, `topleft vsplit` positioning
   - Target: Better panel layout, improved visual hierarchy

2. **Trouble panel positioning** (`lua/plugins/trouble.lua`)
   - Current issues: Inconsistent positioning (some right, some toggle)
   - Target: Standardize bottom panel for all trouble modes

3. **Terminal panel** (NEW)
   - Status: Not yet implemented
   - Target: Right panel with toggle, multiple buffers, persistent processes
   - Keybindings: `<leader>t` prefix
   - Goal: Eliminate need to switch to external terminal

4. **Symbols picker** (`lua/plugins/trouble.lua:31-34`)
   - Current: Trouble symbols panel (`<leader>xs`)
   - Target: Replace with snacks picker or floating window

---

## Future Enhancements

### Planned Features

#### UI/UX Improvements (Stay in Neovim Longer)
These improvements focus on enhancing the in-editor experience to reduce context switching:

- **Improved grug-far panel**: Better styling and layout for global search/replace
  - Current: `topleft vsplit` with basic styling
  - Planned: Full-height right panel with better visual hierarchy
  - Goal: Make search/replace more comfortable for extended use

- **Trouble panel positioning**: Bottom panel layout for diagnostics
  - Current: Some modes open on right, inconsistent positioning
  - Planned: Configure all trouble modes to open on bottom
  - Goal: Keep code visible while reviewing diagnostics

- **Persistent terminal panel**: Right-side terminal with toggle support
  - Current: No dedicated terminal management
  - Planned: Right panel with easy toggle (`<leader>t?`)
  - Features:
    - Multiple terminal buffers (tabs within panel)
    - Always maintain at least one terminal
    - Doesn't terminate processes on hide
    - Quick access for build/test/run commands
  - Goal: Eliminate need to switch to external terminal

- **Better symbols picker**: Replace current symbols panel
  - Current: Trouble symbols as right panel (`<leader>xs`)
  - Planned: Snacks picker or floating window for symbols
  - Goal: Faster, less intrusive symbol navigation
  - Consider: Document symbols vs workspace symbols

#### Advanced Development Tools
- **nvim-dap**: Debug Adapter Protocol for debugging support
  - Set breakpoints visually
  - Step through code execution
  - Variable inspection
  - Integration with DAP UI

#### Code Snippets
- Add snippet engine (LuaSnip or similar)
- Language-specific snippet collections
- Custom snippet creation workflow

#### Testing Integration
- Test runner integration (neotest or similar)
- Run tests from within Neovim
- Test result visualization
- Coverage reporting

### Under Consideration

#### Window Management
- **edgy.nvim**: Advanced window and panel management
  - Persistent sidebar layouts
  - Better control over plugin windows
  - Floating window positioning

### Maintenance Tasks

#### Cleanup
- Clean up which-key visible shortcuts for better display
- Fix dashboard ASCII art formatting
- Mason cleanup: Uninstall vtsls and other unused LSP servers

#### Documentation
- Document kitty.conf requirements for vim-kitty-navigator
- Add troubleshooting guide for common issues
- Create migration guide for updating from older configs

---

## Known Issues

### Terminal Integration
- **Option+Arrow keys**: Don't work in Kitty without additional terminal configuration
- **Workaround**: Using Option+Shift+Arrow for line movement
- **Action Required**: Document kitty.conf settings for full key support

### Plugin Conflicts
- **vtsls vs ts_ls**: Mason has both installed; only ts_ls is used
- **Action Required**: Clean up unused Mason packages (vtsls, gopls, rust-analyzer)

---

## Version History

### v1.0 (Current)
- Initial stable release
- Complete LSP infrastructure with 12 language servers
- Modern completion with Copilot integration
- Comprehensive git integration
- Flash navigation and search/replace
- Todo comment highlighting
- Full documentation and AI assistance

---

## Contributing

When modifying this configuration:

1. **Test Changes**: Ensure plugins load correctly (`:Lazy`)
2. **Update Docs**: Keep CLAUDE.md and roadmap.md in sync
3. **Lock Versions**: Commit lazy-lock.json after updates
4. **Document Keys**: Add descriptions to all new keybindings
5. **Follow Patterns**: Use established patterns for plugin config
6. **Modular Structure**: Keep plugin configs in appropriate files

---

## References

- [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim): Inspiration and best practices
- [Lazy.nvim](https://github.com/folke/lazy.nvim): Plugin manager documentation
- [Neovim Documentation](https://neovim.io/doc/): Official Neovim docs
