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
├── init.lua                       # Entry point - sets leader keys, loads config
├── docs/
│   ├── keybinds.md               # Complete keybinding guide
│   ├── roadmap.md                # Development roadmap and feature tracking
│   └── performance-optimization.md  # Performance improvements
├── lua/
│   ├── config/
│   │   ├── lazy.lua              # lazy.nvim bootstrap and setup
│   │   ├── opts.lua              # Neovim options (line numbers, tabs, etc.)
│   │   ├── autocmds.lua          # Autocommands and event handlers
│   │   └── keybinds.lua          # Keybindings and mappings
│   └── plugins/
│       ├── init.lua              # Core plugins (plenary, icons, etc.)
│       ├── rose-pine.lua         # Color scheme
│       ├── oil.lua               # File explorer
│       ├── nvim-notify.lua       # Notifications
│       ├── noice.lua             # UI overhaul
│       ├── snacks.lua            # Dashboard, picker, zen mode
│       ├── nvim-scrollbar.lua    # Scrollbar
│       ├── nvim-highlight-colors.lua  # Color highlighting
│       ├── lsp.lua               # LSP + Mason configuration
│       ├── blink-cmp.lua         # Completion engine
│       ├── copilot.lua           # Copilot backend
│       ├── claudecode.lua        # Claude Code integration
│       ├── conform.lua           # Formatting
│       ├── flash.lua             # Quick navigation
│       ├── grug-far.lua          # Search and replace
│       ├── todo-comments.lua     # Todo highlighting
│       ├── edgy.lua              # Panel & window management
│       ├── gitsigns.lua          # Git decorations
│       ├── lazygit.lua           # Git UI
│       ├── treesitter.lua        # Treesitter for syntax highlighting
│       ├── which-key.lua         # Keybinding discovery
│       ├── lualine.lua           # Statusline
│       ├── mini.lua              # Mini.nvim modules
│       └── trouble.lua           # Diagnostics UI
└── lazy-lock.json                # Plugin version lockfile
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

### Core & UI (lua/plugins/init.lua, rose-pine.lua, oil.lua, nvim-notify.lua, noice.lua, snacks.lua, nvim-scrollbar.lua, nvim-highlight-colors.lua, lualine.lua)
- **rose-pine**: Color scheme (rose-pine-moon variant)
- **mini.icons**: Fast, minimal icon provider (from mini.nvim)
- **plenary.nvim**: Utility library for other plugins (lazy-loaded)
- **dressing.nvim**: UI improvements (loaded on VeryLazy event)
- **vim-kitty-navigator**: Seamless navigation between Kitty terminal and Neovim splits
- **oil.nvim**: File explorer with hidden files enabled (shows dotfiles)
- **nvim-notify**: Notification manager with custom styling
- **noice.nvim**: Enhanced UI for messages, cmdline, and popupmenu with message filtering and LSP doc scrolling
- **snacks.nvim**: Modern plugin collection with picker (fuzzy finder with hidden files and 20+ search commands), dashboard, zen mode (distraction-free coding), bigfile handling, lazygit integration (with colorscheme theming), and git browse (open repo in browser)
- **nvim-scrollbar**: Scrollbar with diagnostic, search, and cursor position markers
- **nvim-highlight-colors**: Inline color highlighting for hex codes, rgb(), etc.
- **lualine.nvim**: Statusline with custom breadcrumb navigation, git branch, and diff info
- **mini.nvim**: Collection of minimal plugins (pairs, comment, bufremove, icons)
- **nvim-surround**: Add/delete/change surrounding characters and HTML tags (lua/plugins/nvim-surround.lua)
- **flash.nvim**: Quick navigation with search labels and Treesitter integration (lua/plugins/flash.lua)
- **grug-far.nvim**: Search and replace across files (lua/plugins/grug-far.lua)
- **todo-comments.nvim**: Highlight and search TODO comments (lua/plugins/todo-comments.lua)
- **edgy.nvim**: Organized panel management for terminals, search/replace, and diagnostics (lua/plugins/edgy.lua)

### Completion & AI (lua/plugins/blink-cmp.lua, copilot.lua, claudecode.lua)
- **blink.cmp**: Modern, high-performance completion engine (Rust-based, <4ms updates)
- **blink-cmp-copilot**: GitHub Copilot integration for blink.cmp
- **copilot.lua**: GitHub Copilot backend (API connection and authentication)
- **claude-code.nvim**: Claude Code integration (30% right split, mutually exclusive with terminal, `<A-a>` to toggle)

### LSP & Language Support (lua/plugins/lsp.lua)
- **mason.nvim**: Package manager for LSP servers, formatters, and linters
- **mason-lspconfig.nvim**: Bridges mason with nvim-lspconfig
- **mason-tool-installer.nvim**: Auto-install formatters and linters
- **nvim-lspconfig**: Configurations for LSP servers (using modern vim.lsp.config API)
- **schemastore.nvim**: JSON schema validation for config files (provides intelligent completion for package.json, tsconfig.json, etc.)

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
- **jsonls**: JSON (with schemastore for intelligent completion)
- **html**: HTML
- **cssls**: CSS

### Formatting & Code Quality (lua/plugins/conform.lua)
- **conform.nvim**: Fast, async formatter with format-on-save

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
- **Plugin specs** (one plugin per file for modularity):
  - Core: `lua/plugins/init.lua` (plenary, icons, dressing, vim-kitty-navigator)
  - Color scheme: `lua/plugins/rose-pine.lua`
  - File explorer: `lua/plugins/oil.lua`
  - Notifications: `lua/plugins/nvim-notify.lua`
  - UI overhaul: `lua/plugins/noice.lua`
  - Utilities: `lua/plugins/snacks.lua` (dashboard, picker, zen mode, bigfile)
  - Scrollbar: `lua/plugins/nvim-scrollbar.lua`
  - Color highlighting: `lua/plugins/nvim-highlight-colors.lua`
  - LSP: `lua/plugins/lsp.lua` (mason, lspconfig, schemastore, tool-installer)
  - Completion: `lua/plugins/blink-cmp.lua` (blink.cmp with Copilot integration)
  - Copilot: `lua/plugins/copilot.lua` (GitHub Copilot backend)
  - Claude Code: `lua/plugins/claudecode.lua` (AI-powered coding)
  - Formatting: `lua/plugins/conform.lua`
  - Quick navigation: `lua/plugins/flash.lua`
  - Search/replace: `lua/plugins/grug-far.lua`
  - Todo comments: `lua/plugins/todo-comments.lua`
  - Panel management: `lua/plugins/edgy.lua`
  - Git decorations: `lua/plugins/gitsigns.lua`
  - Git UI: `lua/plugins/lazygit.lua`
  - Syntax highlighting: `lua/plugins/treesitter.lua`
  - Keybinding help: `lua/plugins/which-key.lua`
  - Statusline: `lua/plugins/lualine.lua`
  - Mini modules: `lua/plugins/mini.lua`
  - Surround text: `lua/plugins/nvim-surround.lua`
  - Diagnostics UI: `lua/plugins/trouble.lua`
- **Bootstrap logic**: Located in `lua/config/lazy.lua:1-16`
- **Lazy.nvim settings**: Configured in `lua/config/lazy.lua`

## Important Keybindings

> **Complete Reference**: See [docs/keybinds.md](docs/keybinds.md) for a comprehensive, organized guide to all keybindings.

The following is a quick reference of the most commonly used keybindings. For full details, examples, and tips, refer to the complete keybindings documentation.

### Navigation
- `<C-h/j/k/l>` - Navigate between Neovim splits and Kitty terminal windows (handled by vim-kitty-navigator)
- Note: Do NOT manually set `<C-h/j/k/l>` keybinds as they conflict with vim-kitty-navigator

### Window Management (w)
#### Navigation
- `<leader>wh/j/k/l` - Go to Left/Lower/Upper/Right Window
- `<leader>ww` - Switch Windows
- `<leader>wH/J/K/L` - Move Window Far Left/Down/Up/Right

#### Splits
- `<leader>ws` / `<leader>w-` - Split Window Below
- `<leader>wv` / `<leader>w|` - Split Window Right

#### Close/Quit
- `<leader>wd` - Delete Window
- `<leader>wq` - Quit Window
- `<leader>wo` - Close All Other Windows

#### Resize
- `<leader>w+` / `<leader>w-` - Increase/Decrease Height
- `<leader>w>` / `<leader>w<` - Increase/Decrease Width
- `<leader>w=` - Equalize Windows

#### Maximize
- `<leader>w_` - Maximize Height
- `<leader>w|` - Maximize Width

#### Swap & Zoom
- `<leader>wx` - Swap with Next
- `<leader>wm` - Maximize Toggle (Zoom)

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

### Search Commands (LazyVim-style)
- `<leader>sa` - Search Autocmds
- `<leader>sb` - Search Buffer Lines
- `<leader>sB` - Search Grep Buffers
- `<leader>sc` - Search Command History
- `<leader>sC` - Search Commands
- `<leader>sd` - Search Diagnostics (Current Buffer)
- `<leader>sD` - Search Diagnostics (Workspace)
- `<leader>sg` - Search Grep
- `<leader>sh` - Search Help
- `<leader>sH` - Search Highlights
- `<leader>si` - Search Icons
- `<leader>sj` - Search Jumps
- `<leader>sk` - Search Keymaps
- `<leader>sl` - Search Location List
- `<leader>sm` - Search Marks
- `<leader>sM` - Search Man Pages
- `<leader>sq` - Search Quickfix
- `<leader>sR` - Search Resume
- `<leader>s"` - Search Registers
- `<leader>s/` - Search History
- `<leader>ss` - Search Buffer Symbols (LSP)
- `<leader>sS` - Search Workspace Symbols (LSP)
- `<leader>sw` - Search Word

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
- `<leader>gg` - LazyGit (Root Dir) - Opens lazygit at git root
- `<leader>gc` - LazyGit (cwd) - Opens lazygit at current working directory
- `<leader>gl` - Git Log - Opens git log in lazygit
- `<leader>gf` - Git File History - Opens current file's git history
- `<leader>gb` - Git Browse (open) - Opens current file/repo in browser (GitHub/GitLab)
- `<leader>gB` - Git Browse (copy) - Copies browser URL to clipboard

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

### Surround (nvim-surround)
Enclose/surround text with quotes, brackets, tags, etc. using `<leader>e`.

**Normal mode:**
- `<leader>ea{motion}{char}` - Surround motion (e.g., `<leader>eaw"` wraps word in quotes, `<leader>eaw<div>` wraps in div)
- `<leader>eA` - Surround current line
- `<leader>el{motion}{char}` - Surround motion on new lines
- `<leader>eL` - Surround current line on new lines
- `<leader>ed{char}` - Delete surround (e.g., `<leader>ed"` deletes quotes, `<leader>edt` deletes tag)
- `<leader>ec{old}{new}` - Change surround (e.g., `<leader>ec"'` changes quotes, `<leader>ect<span>` changes tag)
- `<leader>eC{old}{new}` - Change surround with new lines

**Visual mode:**
- `<leader>es{char}` - Surround selection (e.g., `<leader>es<div>` wraps in div tag)
- `<leader>eS{char}` - Surround selection with new lines

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
- `-` - Open parent directory with oil.nvim

### UI Toggles (Alt key for quick access)
- `<A-\>` - Toggle terminal (closes Claude Code if open)
- `<A-z>` - Toggle Zen Mode (distraction-free coding)
- `<A-a>` - Toggle Claude Code (closes terminal if open)
- `<A-f>` - Toggle Find and Replace (Grug-far)

**Note:** Terminal and Claude Code are mutually exclusive - opening one automatically closes the other.

### AI Tools (Claude Code)
- `<A-a>` - Toggle Claude Code (quick access)
- `<leader>ac` - Toggle Claude Code
- `<leader>af` - Focus Claude Code window
- `<leader>ar` - Resume previous Claude session
- `<leader>aC` - Continue last conversation
- `<leader>ab` - Add current buffer to context
- `<leader>as` - Send selection to Claude (visual mode) or add file from file explorer
- `<leader>aa` - Accept diff changes
- `<leader>ad` - Deny diff changes

### Quick Actions (Single-Letter Shortcuts)
- `<leader>W` - Write/Save buffer
- `<leader>X` - Delete buffer
- `<leader>l` - Lazy plugin manager
- `<leader>n` - Notification history
- `<leader>\` - Toggle terminal

### Quit
- `<leader>qq` - Quit window
- `<leader>qa` - Quit all
- `<leader>qQ` - Quit without saving

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
