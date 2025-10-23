# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using lazy.nvim as the plugin manager. The configuration follows a modular structure where plugins are loaded lazily to optimize startup time.

## Architecture

### Entry Point
- `init.lua`: Sets leader keys FIRST, then loads: lazy → opts → autocmds → keybinds

### Configuration Structure
```
.
├── init.lua                    # Entry point - sets leader keys, loads config
├── todos.md                    # Development TODO list
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # lazy.nvim bootstrap and setup
│   │   ├── opts.lua           # Neovim options (line numbers, tabs, etc.)
│   │   ├── autocmds.lua       # Autocommands and event handlers
│   │   └── keybinds.lua       # Keybindings and mappings
│   └── plugins/
│       ├── init.lua           # Core plugins (colorscheme, icons, etc.)
│       ├── ui.lua             # UI plugins (oil, telescope)
│       ├── lsp.lua            # LSP configuration (mason, lspconfig)
│       ├── code.lua           # Formatting & linting (conform)
│       └── editor.lua         # Editor enhancements (scrollbar)
└── lazy-lock.json             # Plugin version lockfile
```

### Configuration Load Order
The configuration loads in a specific order to ensure proper initialization:
1. **init.lua**: Sets leader keys (CRITICAL - must be first!)
2. **lazy.lua**: Bootstraps lazy.nvim and loads all plugins
3. **opts.lua**: Sets Neovim options
4. **autocmds.lua**: Sets up autocommands
5. **keybinds.lua**: Configures keybindings (after plugins are loaded)

### Plugin Management
- Uses **lazy.nvim** for plugin management
- Leader key: `<Space>` (set in `init.lua` BEFORE lazy loads)
- Local leader key: `<Space>` (set in `init.lua` BEFORE lazy loads)
- Plugins are defined across `lua/plugins/*.lua` files and auto-imported via the lazy.nvim spec
- Plugin versions are locked in `lazy-lock.json`
- **IMPORTANT**: Leader keys MUST be set in `init.lua` before requiring `config.lazy`

### Key Architectural Patterns
1. **Lazy Loading**: Plugins use lazy loading strategies (events, commands) to minimize startup time
2. **Modular Plugin Specs**: Each plugin can be a separate file in `lua/plugins/` or grouped in `init.lua`
3. **Auto-Import**: The lazy.nvim setup automatically imports all plugin specs from the `plugins` directory

## Plugin Management Commands

### Installing/Updating Plugins
```bash
# Open Neovim - plugins will auto-install on first run
nvim

# Inside Neovim, update plugins:
:Lazy update

# Check plugin status:
:Lazy

# Sync plugins (clean + update):
:Lazy sync
```

### Testing Configuration
```bash
# Launch Neovim to test configuration
nvim

# Test with a specific file
nvim test.lua

# Launch with minimal config (troubleshooting)
nvim --clean
```

## Current Plugin Stack

### Core & UI (lua/plugins/init.lua, ui.lua, editor.lua)
- **rose-pine**: Color scheme (rose-pine-moon variant)
- **which-key.nvim**: Keybinding help (lazy-loaded)
- **nvim-web-devicons**: Icon support (lazy-loaded)
- **plenary.nvim**: Utility library for other plugins (lazy-loaded)
- **dressing.nvim**: UI improvements (loaded on VeryLazy event)
- **vim-kitty-navigator**: Seamless navigation between Kitty terminal and Neovim splits
- **oil.nvim**: File explorer that lets you edit your filesystem like a buffer
- **telescope.nvim**: Fuzzy finder for files, grep, buffers, and more
- **telescope-fzf-native**: Native FZF sorting for better telescope performance
- **nvim-scrollbar**: Scrollbar with diagnostic, search, and cursor position markers

### LSP & Language Support (lua/plugins/lsp.lua)
- **mason.nvim**: Package manager for LSP servers, formatters, and linters
- **mason-lspconfig.nvim**: Bridges mason with nvim-lspconfig
- **nvim-lspconfig**: Configurations for LSP servers (using modern vim.lsp.config API)

**Configured Language Servers:**
- **lua_ls**: Lua (Neovim configuration)
- **ts_ls**: TypeScript/JavaScript (with inlay hints)
- **eslint**: ESLint linting for TS/JS
- **ruby_lsp**: Ruby and Rails
- **pyright**: Python (with workspace analysis)
- **bashls**: Bash scripts
- **tailwindcss**: Tailwind CSS (with custom class regex patterns)

### Formatting & Code Quality (lua/plugins/code.lua)
- **conform.nvim**: Fast, async formatter with format-on-save
- **mason-tool-installer.nvim**: Auto-install formatters and linters

**Configured Formatters:**
- **prettier**: JavaScript, TypeScript, CSS, HTML, JSON, YAML, Markdown
- **eslint_d**: ESLint daemon for fast auto-fixing (TS/JS)
- **stylua**: Lua formatter
- **black + isort**: Python formatting and import sorting
- **rubocop**: Ruby formatter/linter
- **shfmt**: Shell script formatter

## Adding New Plugins

Add plugin specifications to `lua/plugins/init.lua` following the lazy.nvim spec format:

```lua
{
  "author/plugin-name",
  lazy = true,  -- or false for immediate loading
  event = "VeryLazy",  -- optional: event-based loading
  config = function()
    -- plugin configuration
  end,
}
```

For larger configurations, create separate files in `lua/plugins/` (e.g., `lua/plugins/lsp.lua`, `lua/plugins/treesitter.lua`) and they will be auto-imported.

## Configuration Locations

- **Leader keys**: Set in `init.lua` (MUST be before lazy.nvim loads!)
- **Neovim options**: `lua/config/opts.lua` (line numbers, tabs, clipboard, etc.)
- **Keybindings**: `lua/config/keybinds.lua` (custom keymaps, see below for details)
- **Autocommands**: `lua/config/autocmds.lua` (highlight yank, trim whitespace, etc.)
- **Plugin specs**:
  - Core: `lua/plugins/init.lua`
  - UI: `lua/plugins/ui.lua`
  - LSP: `lua/plugins/lsp.lua`
  - Formatting: `lua/plugins/code.lua`
  - Editor: `lua/plugins/editor.lua`
- **Bootstrap logic**: Located in `lua/config/lazy.lua:1-16`
- **Lazy.nvim settings**: Configured in `lua/config/lazy.lua`

## Important Keybindings

### Navigation
- `<C-h/j/k/l>` - Navigate between Neovim splits and Kitty terminal windows (handled by vim-kitty-navigator)
- Note: Do NOT manually set `<C-h/j/k/l>` keybinds as they conflict with vim-kitty-navigator

### Window Management
- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split

### Tab Management
- `<leader>to` - Open new tab
- `<leader>tx` - Close current tab
- `<leader>tn` - Go to next tab
- `<leader>tp` - Go to previous tab
- `<leader>tf` - Open current buffer in new tab

### Line Manipulation
- `Option+Shift+Up/Down` - Move line(s) up/down (works in normal and visual mode)
- `<` / `>` in visual mode - Indent left/right (maintains selection)

### Centered Scrolling
- `<C-d>` / `<C-u>` - Scroll down/up and center cursor
- `<C-Down>` / `<C-Up>` - Alternative scroll down/up and center
- `n` / `N` - Next/previous search result (centered)

### Telescope (Fuzzy Finder)
- `<leader>ff` - Find Files
- `<leader>fg` - Live Grep (search in files)
- `<leader>fb` - Find Buffers
- `<leader>fh` - Find Help tags
- `<leader>fr` - Recent Files
- `<leader>fw` - Find Word under cursor
- `<leader>fd` - Find Diagnostics
- `<leader>fc` - Find Commands
- `<leader>fk` - Find Keymaps
- `<leader>/` - Fuzzy search in current buffer

### LSP (when attached to buffer)
- `gd` - Goto Definition (Telescope)
- `gD` - Goto Declaration
- `gr` - Goto References (Telescope)
- `gI` - Goto Implementation (Telescope)
- `gy` - Goto Type Definition (Telescope)
- `K` - Hover Documentation
- `gK` - Signature Help
- `<leader>ca` - Code Action
- `<leader>rn` - Rename Symbol
- `<leader>e` - Show Diagnostic Float
- `<leader>q` - Quickfix Diagnostics
- `[d` - Previous Diagnostic
- `]d` - Next Diagnostic

### Formatting
- `<leader>f` - Format current buffer
- Auto-format on save (enabled by default)
- `:FormatDisable` - Disable format-on-save globally
- `:FormatDisable!` - Disable format-on-save for current buffer
- `:FormatEnable` - Re-enable format-on-save

### Utilities
- `jk` in insert mode - Exit to normal mode
- `<Esc>` in normal mode - Clear search highlights
- `<Esc><Esc>` in terminal mode - Exit terminal mode
- `<leader>w` - Save file
- `<leader>p` - Paste without yanking (visual mode)
- `<leader>d` - Delete without yanking
- `-` - Open parent directory with oil.nvim

## Modifying Configuration

### Adding Options
Edit `lua/config/opts.lua` to add or modify Neovim settings (display, editing behavior, performance, etc.)

### Adding Keybindings
Edit `lua/config/keybinds.lua` using the pattern:
```lua
keymap.set("n", "<leader>key", "<cmd>command<CR>", { desc = "Description" })
```

### Adding Autocommands
Edit `lua/config/autocmds.lua` using the pattern:
```lua
autocmd("Event", {
  group = augroup("group_name", { clear = true }),
  callback = function()
    -- your code
  end,
})
```
