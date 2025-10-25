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
├── docs/
│   └── roadmap.md             # Development roadmap and feature tracking
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # lazy.nvim bootstrap and setup
│   │   ├── opts.lua           # Neovim options (line numbers, tabs, etc.)
│   │   ├── autocmds.lua       # Autocommands and event handlers
│   │   └── keybinds.lua       # Keybindings and mappings
│   └── plugins/
│       ├── init.lua           # Core plugins (colorscheme, icons, etc.)
│       ├── ui.lua             # UI plugins (oil, snacks dashboard)
│       ├── picker.lua         # Snacks picker (fuzzy finder)
│       ├── lsp.lua            # LSP configuration (mason, lspconfig)
│       ├── code.lua           # Formatting & linting (conform)
│       ├── editor.lua         # Editor enhancements (scrollbar)
│       ├── edgy.lua           # Panel & window management
│       ├── treesitter.lua     # Treesitter for syntax highlighting
│       ├── ai.lua             # AI tools (Claude Code)
│       └── which-key.lua      # Keybinding discovery
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

### Core & UI (lua/plugins/init.lua, ui.lua, picker.lua, editor.lua, lualine.lua)
- **rose-pine**: Color scheme (rose-pine-moon variant)
- **nvim-web-devicons**: Icon support (lazy-loaded)
- **plenary.nvim**: Utility library for other plugins (lazy-loaded)
- **dressing.nvim**: UI improvements (loaded on VeryLazy event)
- **vim-kitty-navigator**: Seamless navigation between Kitty terminal and Neovim splits
- **oil.nvim**: File explorer with hidden files enabled (shows dotfiles)
- **nvim-notify**: Notification manager with custom styling
- **noice.nvim**: Enhanced UI for messages, cmdline, and popupmenu with message filtering and LSP doc scrolling
- **snacks.nvim**: Modern plugin collection with picker (fuzzy finder with hidden files), dashboard, zen mode (distraction-free coding), and bigfile handling
- **nvim-scrollbar**: Scrollbar with diagnostic, search, and cursor position markers
- **lualine.nvim**: Statusline with custom breadcrumb navigation, git branch, and diff info
- **mini.nvim**: Collection of minimal plugins (pairs, surround, comment, bufremove, icons)
- **flash.nvim**: Quick navigation with search labels and Treesitter integration
- **grug-far.nvim**: Search and replace across files
- **todo-comments.nvim**: Highlight and search TODO comments
- **edgy.nvim**: Organized panel management for terminals, search/replace, and diagnostics

### Completion & AI (lua/plugins/completion.lua, copilot.lua, ai.lua)
- **blink.cmp**: Modern, high-performance completion engine (Rust-based, <4ms updates)
- **blink-cmp-copilot**: GitHub Copilot integration for blink.cmp
- **copilot.lua**: GitHub Copilot backend (API connection and authentication)
- **claudecode.nvim**: Claude Code integration for AI-powered coding assistance with diff management (`<A-l>` to toggle)

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
- **prismals**: Prisma schema files
- **marksman**: Markdown
- **jsonls**: JSON
- **html**: HTML
- **cssls**: CSS

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

### Treesitter (lua/plugins/treesitter.lua)
- **nvim-treesitter**: Advanced syntax highlighting and code understanding (configured using `opts` pattern)
- **nvim-treesitter-textobjects**: Textobject selections based on treesitter
- **nvim-ts-autotag**: Auto-close and auto-rename HTML/JSX/XML tags

**Configured Parsers:**
- Core: bash, c, diff, lua, luadoc, luap, printf, query, regex, vim, vimdoc
- Web: html, javascript, typescript, tsx, jsdoc, json, jsonc, xml, yaml, toml
- Documentation: markdown, markdown_inline
- Python: python

**Features:**
- Auto-installs parsers for all configured languages
- Incremental selection with `<C-space>` (expand) and `<bs>` (shrink)
- Smart indentation (disabled for Ruby and Python where LSP handles it better)
- Textobjects: `af`/`if` (functions), `ac`/`ic` (classes), `aa`/`ia` (parameters)
- Navigation: `]f`/`[f` (functions), `]c`/`[c` (classes)
- Automatic tag closing/renaming for HTML, JSX, XML, etc.

### Which-Key (lua/plugins/which-key.lua)
- **which-key.nvim**: Interactive keybinding discovery and help

**Features:**
- Helix preset for clean, vertical layout
- Auto-discovers all keybindings with descriptions
- Organized groups: find, buffer, code, split, goto, prev, next
- `<leader>?` - Show buffer-local keymaps

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
  - Picker: `lua/plugins/picker.lua`
  - LSP: `lua/plugins/lsp.lua`
  - Completion: `lua/plugins/completion.lua` (blink.cmp with Copilot integration)
  - Copilot: `lua/plugins/copilot.lua` (GitHub Copilot backend)
  - AI: `lua/plugins/ai.lua` (Claude Code integration)
  - Code: `lua/plugins/code.lua` (formatting, search/replace, flash, todo-comments)
  - Editor: `lua/plugins/editor.lua`
  - Edgy: `lua/plugins/edgy.lua` (panel & window management)
  - Git: `lua/plugins/git.lua`
  - Treesitter: `lua/plugins/treesitter.lua`
  - Which-Key: `lua/plugins/which-key.lua`
- **Bootstrap logic**: Located in `lua/config/lazy.lua:1-16`
- **Lazy.nvim settings**: Configured in `lua/config/lazy.lua`

## Important Keybindings

> **Complete Reference**: See [docs/keybinds.md](docs/keybinds.md) for a comprehensive, organized guide to all keybindings.

The following is a quick reference of the most commonly used keybindings. For full details, examples, and tips, refer to the complete keybindings documentation.

### Navigation
- `<C-h/j/k/l>` - Navigate between Neovim splits and Kitty terminal windows (handled by vim-kitty-navigator)
- Note: Do NOT manually set `<C-h/j/k/l>` keybinds as they conflict with vim-kitty-navigator

### Window Management
- `<leader>w-` - Split window below (horizontal)
- `<leader>w|` - Split window right (vertical)
- `<leader>w=` - Balance windows
- `<leader>wd` - Delete window
- `<leader>ww` - Switch to other window
- `<leader>wh/j/k/l` - Resize window (decrease width, decrease height, increase height, increase width)

### Buffer Management
- `<leader><leader>` - List Buffers (quick access)
- `<leader>bb` - List Buffers
- `<leader>bd` - Delete Buffer
- `<leader>bn` - Next Buffer
- `<leader>bp` - Previous Buffer
- `<leader>bw` - Write/Save Buffer

### Line Manipulation
- `Option+Shift+Up/Down` - Move line(s) up/down (works in normal and visual mode)
- `Ctrl+Shift+Up/Down` - Duplicate line(s) up/down (works in normal and visual mode)
- `<` / `>` in visual mode - Indent left/right (maintains selection)
- `c` / `C` - Change without yanking (doesn't copy to clipboard)

### Centered Scrolling
- `<C-d>` / `<C-u>` - Scroll down/up and center cursor
- `<C-Down>` / `<C-Up>` - Alternative scroll down/up and center
- `n` / `N` - Next/previous search result (centered)

### Snacks Picker (Fuzzy Finder)
- `<leader>ff` - Find Files
- `<leader>fs` - Find String (live grep)
- `<leader>fh` - Find Help tags
- `<leader>fH` - Find Highlight groups
- `<leader>fr` - Find Recent Files
- `<leader>fw` - Find Word under cursor
- `<leader>fd` - Find Diagnostics
- `<leader>fc` - Find Config Files
- `<leader>fp` - Find Projects
- `<leader>fC` - Find Commands
- `<leader>fk` - Find Keymaps
- `<leader>/` - Fuzzy search in current buffer

### Search & Navigation
- `<leader>sr` - Search and Replace (grug-far)
- `<leader>st` - Search Todo Comments
- `<leader>sT` - Search Todo/Fix/Fixme
- `s` - Flash jump (quick navigation)
- `S` - Flash Treesitter (jump to treesitter nodes)
- `]t` / `[t` - Next/Previous todo comment

### Notifications & Messages (Noice)
- `<leader>snl` - Show Last Message
- `<leader>snh` - Show Message History
- `<leader>sna` - Show All Messages
- `<leader>snd` - Dismiss All Notifications
- `<leader>snt` - Open Noice Picker
- `<S-Enter>` - Redirect Cmdline (command mode)
- `<C-f>` / `<C-b>` - Scroll Forward/Backward in LSP hover docs (insert, normal, select modes)

### Git
- `<leader>gg` - LazyGit (full Git UI)

### Git Hunks
- `]h` / `[h` - Next/Previous hunk
- `]H` / `[H` - Last/First hunk
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk
- `<leader>ghS` - Stage buffer
- `<leader>ghu` - Undo stage hunk
- `<leader>ghR` - Reset buffer
- `<leader>ghp` - Preview hunk inline
- `<leader>ghb` - Blame line
- `<leader>ghB` - Blame buffer
- `<leader>ghd` - Diff this
- `<leader>ghD` - Diff this ~
- `ih` - Select hunk (text object)

### LSP (when attached to buffer)
- `gd` - Goto Definition (Snacks picker)
- `gD` - Goto Declaration
- `gr` - References (Snacks picker)
- `gI` - Goto Implementation (Snacks picker)
- `gy` - Goto T[y]pe Definition (Snacks picker)
- `K` - Hover
- `gK` - Signature Help
- `<c-k>` - Signature Help (insert mode)
- `[d` - Prev Diagnostic
- `]d` - Next Diagnostic

### Code Actions (always available)
- `<leader>cf` - Code Format
- `<leader>cl` - LSP Info

### Code Actions (when LSP attached)
- `<leader>ca` - Code Action (n, x)
- `<leader>cA` - Source Action
- `<leader>ci` - Code Info (hover documentation)
- `<leader>cr` - Rename
- `<leader>cR` - Rename File
- `<leader>cc` - Run Codelens (n, x)
- `<leader>cC` - Refresh & Display Codelens

### Formatting
- Auto-format on save (enabled by default)
- `:FormatDisable` - Disable format-on-save globally
- `:FormatDisable!` - Disable format-on-save for current buffer
- `:FormatEnable` - Re-enable format-on-save

### Treesitter Selection
- `<C-space>` - Start/expand selection to next syntax node (normal/visual mode)
- `<bs>` - Shrink selection to previous syntax node (visual mode)
- `af` / `if` - Select around/inside function (with operator: `daf`, `yif`, `vaf`)
- `ac` / `ic` - Select around/inside class
- `aa` / `ia` - Select around/inside parameter
- `]f` / `[f` - Jump to next/previous function
- `]c` / `[c` - Jump to next/previous class

### Which-Key
- `<Space>` (wait 500ms) - Show all leader keybindings
- Press any prefix key (like `g`, `[`, `]`) and wait to see available commands

### Completion (blink.cmp)
- `<CR>` (Enter) - Accept selected completion (insert mode)
- `<C-y>` - Force accept current item (insert mode)
- `<C-n>` / `<C-p>` - Navigate down/up through completions (insert mode)
- `<C-Space>` - Show/toggle completions (insert mode)
- `<C-e>` - Hide completion menu (insert mode)

**Completion Sources** (priority order):
1. **Copilot** - AI-powered suggestions (highest priority)
2. **LSP** - Language server completions
3. **Path** - File path completions
4. **Snippets** - Code snippets
5. **Buffer** - Text from current buffer

### Utilities
- `jk` in insert mode - Exit to normal mode
- `<Esc>` in normal mode - Clear search highlights
- `<Esc><Esc>` in terminal mode - Exit terminal mode
- `:w` - Save file (standard vim)
- `<leader>p` - Paste without yanking (visual mode)
- `<leader>d` - Delete without yanking
- `<leader>z` - Toggle Zen Mode (distraction-free coding with centered window, no line numbers, no statusline)
- `-` - Open parent directory with oil.nvim

### AI Tools (Claude Code)
- `<A-l>` - Toggle Claude Code (quick access)
- `<leader>ac` - Toggle Claude Code
- `<leader>af` - Focus Claude Code window
- `<leader>ar` - Resume previous Claude session
- `<leader>aC` - Continue last conversation
- `<leader>ab` - Add current buffer to context
- `<leader>as` - Send selection to Claude (visual mode) or add file from file explorer
- `<leader>aa` - Accept diff changes
- `<leader>ad` - Deny diff changes

### Terminal
- `<A-\>` - Toggle floating terminal (works in normal and terminal mode)

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
