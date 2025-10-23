# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using lazy.nvim as the plugin manager. The configuration follows a modular structure where plugins are loaded lazily to optimize startup time.

## Architecture

### Entry Point
- `init.lua`: Main entry point that loads configuration in order: opts → keybinds → lazy → autocmds

### Configuration Structure
```
.
├── init.lua                    # Entry point - loads all config modules
├── lua/
│   ├── config/
│   │   ├── opts.lua           # Neovim options (line numbers, tabs, etc.)
│   │   ├── keybinds.lua       # Keybindings and mappings
│   │   ├── lazy.lua           # lazy.nvim bootstrap and setup
│   │   └── autocmds.lua       # Autocommands and event handlers
│   └── plugins/
│       └── init.lua           # Plugin specifications
└── lazy-lock.json             # Plugin version lockfile
```

### Configuration Load Order
The configuration loads in a specific order to ensure proper initialization:
1. **opts.lua**: Sets Neovim options first
2. **keybinds.lua**: Configures keybindings (leader keys are set in lazy.lua)
3. **lazy.lua**: Bootstraps lazy.nvim and loads plugins
4. **autocmds.lua**: Sets up autocommands after everything else

### Plugin Management
- Uses **lazy.nvim** for plugin management
- Leader key: `<Space>`
- Local leader key: `\`
- Plugins are defined in `lua/plugins/init.lua` and auto-imported via the lazy.nvim spec
- Plugin versions are locked in `lazy-lock.json`

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
- **rose-pine**: Color scheme (rose-pine-moon variant)
- **which-key.nvim**: Keybinding help (lazy-loaded)
- **nvim-web-devicons**: Icon support (lazy-loaded)
- **dressing.nvim**: UI improvements (loaded on VeryLazy event)

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

- **Neovim options**: `lua/config/opts.lua` (line numbers, tabs, clipboard, etc.)
- **Keybindings**: `lua/config/keybinds.lua` (window management, navigation, etc.)
- **Leader keys**: Set in `lua/config/lazy.lua:21-22` (before lazy.nvim loads)
- **Autocommands**: `lua/config/autocmds.lua` (highlight yank, trim whitespace, etc.)
- **Plugin specs**: Add to `lua/plugins/init.lua` or create new files in `lua/plugins/`
- **Bootstrap logic**: Located in `lua/config/lazy.lua:1-15`
- **Lazy.nvim settings**: Configured in `lua/config/lazy.lua:25-35`

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
