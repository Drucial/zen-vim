# ZenVim

> A modern, performant Neovim configuration focused on simplicity, speed, and an exceptional developer experience.

![ZenVim Dashboard](dashboard.png)

![ZenVim UI](code-sample.png)

## Philosophy

ZenVim is built on three core principles:

### 1. **Performance First**

- Lazy loading for optimal startup times
- Modern, Rust-based plugins (blink.cmp, flash.nvim)
- Minimal overhead with carefully selected, non-overlapping tools
- Fast fuzzy finding and completion (sub-4ms updates)

### 2. **Simplicity & Clarity**

- Clean, modular architecture
- One tool per job - no redundant plugins
- Intuitive keybindings with which-key discovery
- Sensible defaults that "just work"

### 3. **Developer Experience**

- VSCode/Cursor-like completion workflow
- AI-powered suggestions via GitHub Copilot
- Comprehensive LSP support for 12+ languages
- Beautiful UI with Rose Pine theme and modern components

## Features

- 🚀 **Blazing Fast** - Optimized lazy loading, <50ms startup
- 🎨 **Beautiful UI** - Rose Pine theme, lualine, scrollbar, noice.nvim
- 🤖 **AI-Powered** - GitHub Copilot integration via blink.cmp
- 📝 **Smart Completion** - blink.cmp with LSP, snippets, and Copilot
- 🔍 **Fuzzy Everything** - Snacks picker for files, grep, LSP symbols
- 🌳 **Treesitter** - Advanced syntax highlighting and text objects
- 🔧 **Auto-formatting** - Format on save with conform.nvim
- 🎯 **LSP Ready** - 12 pre-configured language servers
- 🔀 **Git Integration** - GitSigns + LazyGit
- 📦 **Auto-install** - Mason handles all LSP servers, formatters, linters

## Documentation

- ⌨️ **[Keybindings Reference](docs/keybinds.md)** - Complete keybinding guide organized by functionality
- 📖 **[Development Roadmap](docs/roadmap.md)** - Feature tracking, completed work, and future plans
- 🤖 **[CLAUDE.md](CLAUDE.md)** - Detailed documentation for AI assistance and architecture

## Installation

### Prerequisites

- Neovim >= 0.11.0
- Node.js >= 18.x (for Copilot)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (recommended: JetBrainsMono Nerd Font)
- ripgrep (for grep functionality)
- fd (optional, for faster file finding)

### Quick Start

```bash
# Backup your existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone ZenVim
git clone https://github.com/drucial/zen-vim.git ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

### First Launch

On first launch, lazy.nvim will automatically:

1. Install all plugins
2. Compile blink.cmp (Rust components)
3. Install Treesitter parsers
4. Set up Mason LSP servers

This may take 2-3 minutes. Once complete, restart Neovim.

### Post-Installation

**Setup GitHub Copilot:**

```vim
:Copilot auth
```

**Verify health:**

```vim
:checkhealth
```

**Update plugins:**

```vim
:Lazy update
```

## Plugin List

### Core & UI

| Plugin                                                               | Purpose              | Why?                                                             |
| -------------------------------------------------------------------- | -------------------- | ---------------------------------------------------------------- |
| [rose-pine](https://github.com/rose-pine/neovim)                     | Color scheme         | Beautiful, low-contrast theme with excellent syntax highlighting |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)  | Icons                | File type icons throughout the UI                                |
| [dressing.nvim](https://github.com/stevearc/dressing.nvim)           | UI improvements      | Better vim.ui.select and vim.ui.input interfaces                 |
| [vim-kitty-navigator](https://github.com/knubie/vim-kitty-navigator) | Terminal integration | Seamless navigation between Neovim and Kitty terminal            |
| [oil.nvim](https://github.com/stevearc/oil.nvim)                     | File explorer        | Edit your filesystem like a buffer                               |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)               | Notifications        | Beautiful notification manager                                   |
| [noice.nvim](https://github.com/folke/noice.nvim)                    | UI overhaul          | Enhanced cmdline, messages, and popupmenu                        |
| [snacks.nvim](https://github.com/folke/snacks.nvim)                  | Utilities            | Dashboard, picker (fuzzy finder), bigfile handling               |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)       | Scrollbar            | Visual scrollbar with diagnostic/search indicators               |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)         | Statusline           | Beautiful statusline with breadcrumbs and git info               |

### Completion & AI

| Plugin                                                                   | Purpose            | Why?                                              |
| ------------------------------------------------------------------------ | ------------------ | ------------------------------------------------- |
| [blink.cmp](https://github.com/Saghen/blink.cmp)                         | Completion engine  | Modern, Rust-based completion with <4ms updates   |
| [blink-cmp-copilot](https://github.com/giuxtaposition/blink-cmp-copilot) | Copilot bridge     | Integrates Copilot with blink.cmp                 |
| [copilot.lua](https://github.com/zbirenbaum/copilot.lua)                 | AI suggestions     | GitHub Copilot backend for AI-powered completions |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)     | Snippet collection | Pre-configured snippets for dozens of languages   |

### LSP & Language Support

| Plugin                                                                       | Purpose         | Why?                                                |
| ---------------------------------------------------------------------------- | --------------- | --------------------------------------------------- |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                     | Package manager | Install and manage LSP servers, formatters, linters |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | LSP bridge      | Automatically configure installed LSP servers       |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                   | LSP configs     | Pre-configured LSP setups for all languages         |

**Pre-configured Language Servers:**

- TypeScript/JavaScript (ts_ls)
- ESLint (eslint)
- Ruby/Rails (ruby_lsp)
- Python (pyright)
- Bash (bashls)
- Tailwind CSS (tailwindcss)
- Prisma (prismals)
- Markdown (marksman)
- JSON (jsonls)
- HTML (html)
- CSS (cssls)
- Lua (lua_ls)

### Code Quality & Formatting

| Plugin                                                                                    | Purpose        | Why?                                       |
| ----------------------------------------------------------------------------------------- | -------------- | ------------------------------------------ |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                                  | Formatter      | Fast, async formatting with format-on-save |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Tool installer | Auto-install formatters and linters        |

**Pre-configured Formatters:**

- Prettier (TS/JS/CSS/HTML/JSON/YAML/MD)
- eslint_d (TS/JS auto-fix)
- stylua (Lua)
- black + isort (Python)
- rubocop (Ruby)
- shfmt (Shell)

### Editor Enhancements

| Plugin                                                                                        | Purpose           | Why?                                                |
| --------------------------------------------------------------------------------------------- | ----------------- | --------------------------------------------------- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                         | Syntax parsing    | Advanced syntax highlighting and code understanding |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Text objects      | Select/navigate functions, classes, parameters      |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                                  | Auto-close tags   | Auto-close/rename HTML/JSX/XML tags                 |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                                         | Micro-plugins     | Pairs, surround, comment, bufremove, icons          |
| [flash.nvim](https://github.com/folke/flash.nvim)                                             | Navigation        | Quick jump navigation with search labels            |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)                                   | Search/Replace    | Visual search and replace across files              |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                             | Todo highlighting | Highlight and search TODO/FIXME/NOTE comments       |

### Git Integration

| Plugin                                                      | Purpose         | Why?                                          |
| ----------------------------------------------------------- | --------------- | --------------------------------------------- |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations | Show git changes in sign column, inline blame |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)    | Git UI          | Full-featured Git interface                   |

### Utilities

| Plugin                                                    | Purpose         | Why?                                               |
| --------------------------------------------------------- | --------------- | -------------------------------------------------- |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding help | Interactive keybinding discovery                   |
| [trouble.nvim](https://github.com/folke/trouble.nvim)     | Diagnostics UI  | Beautiful diagnostics, quickfix, and location list |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)  | Lua utilities   | Required by many plugins                           |

## Key Bindings

<details>
<summary><b>📋 Leader Key Commands (Space)</b></summary>

### File Operations (f)

- `<leader>ff` - Find Files
- `<leader>fs` - Find String (live grep)
- `<leader>fh` - Find Help tags
- `<leader>fr` - Find Recent Files
- `<leader>fw` - Find Word under cursor
- `<leader>fd` - Find Diagnostics
- `<leader>fc` - Find Config Files
- `<leader>fp` - Find Projects
- `<leader>fC` - Find Commands
- `<leader>fk` - Find Keymaps
- `<leader>/` - Fuzzy search in current buffer

### Buffer Management (b)

- `<leader><leader>` - List Buffers (quick access)
- `<leader>bb` - List Buffers
- `<leader>bd` - Delete Buffer
- `<leader>bn` - Next Buffer
- `<leader>bp` - Previous Buffer
- `<leader>bw` - Write/Save Buffer

### Code Actions (c)

- `<leader>cf` - Code Format
- `<leader>cl` - LSP Info
- `<leader>ca` - Code Action
- `<leader>cA` - Source Action
- `<leader>ci` - Code Info (hover)
- `<leader>cr` - Rename
- `<leader>cR` - Rename File
- `<leader>cc` - Run Codelens
- `<leader>cC` - Refresh Codelens

### Search Operations (s)

- `<leader>sr` - Search and Replace (grug-far)
- `<leader>st` - Search Todo Comments
- `<leader>sT` - Search Todo/Fix/Fixme

#### Noice (sn)

- `<leader>snl` - Show Last Message
- `<leader>snh` - Show Message History
- `<leader>sna` - Show All Messages
- `<leader>snd` - Dismiss All Notifications
- `<leader>snt` - Open Noice Picker

### Window Management (w)

- `<leader>w-` - Split Window Below
- `<leader>w|` - Split Window Right
- `<leader>w=` - Balance Windows
- `<leader>wd` - Delete Window
- `<leader>ww` - Switch to Other Window

### Git Operations (g)

- `<leader>gg` - LazyGit (full Git UI)

#### Git Hunks (gh)

- `<leader>ghs` - Stage Hunk
- `<leader>ghr` - Reset Hunk
- `<leader>ghS` - Stage Buffer
- `<leader>ghu` - Undo Stage Hunk
- `<leader>ghR` - Reset Buffer
- `<leader>ghp` - Preview Hunk Inline
- `<leader>ghb` - Blame Line
- `<leader>ghB` - Blame Buffer
- `<leader>ghd` - Diff This
- `<leader>ghD` - Diff This ~

### Diagnostics (x)

- `<leader>xx` - Diagnostics (Trouble)
- `<leader>xX` - Buffer Diagnostics (Trouble)
- `<leader>xs` - Symbols (Trouble)
- `<leader>xl` - LSP Definitions/References (Trouble)
- `<leader>xL` - Location List (Trouble)
- `<leader>xQ` - Quickfix List (Trouble)
- `<leader>xt` - Todo (Trouble)
- `<leader>xT` - Todo/Fix/Fixme (Trouble)

</details>

<details>
<summary><b>⌨️ General Keybindings</b></summary>

### Insert Mode

- `jk` - Exit to normal mode
- `<C-space>` - Show/toggle completions (blink.cmp)
- `<CR>` - Accept selected completion
- `<C-y>` - Force accept current item
- `<C-n>` / `<C-p>` - Navigate completions
- `<C-e>` - Hide completion menu

### Normal Mode

- `<Esc>` - Clear search highlights
- `<C-space>` - Start Treesitter incremental selection
- `<C-d>` / `<C-u>` - Scroll down/up and center
- `n` / `N` - Next/previous search result (centered)
- `s` - Flash jump (quick navigation)
- `S` - Flash Treesitter
- `-` - Open parent directory (oil.nvim)

### Visual Mode

- `<C-space>` - Expand selection to next syntax node
- `<bs>` - Shrink selection to previous syntax node
- `<` / `>` - Indent left/right (maintains selection)
- `<A-S-Down>` / `<A-S-Up>` - Move lines up/down

### LSP (when attached)

- `gd` - Goto Definition
- `gD` - Goto Declaration
- `gr` - References
- `gI` - Goto Implementation
- `gy` - Goto Type Definition
- `K` - Hover
- `gK` - Signature Help
- `[d` / `]d` - Prev/Next Diagnostic

### Navigation

- `]h` / `[h` - Next/Previous git hunk
- `]t` / `[t` - Next/Previous todo comment
- `]f` / `[f` - Next/Previous function
- `]c` / `[c` - Next/Previous class
- `<C-h/j/k/l>` - Navigate splits/Kitty panes

### Treesitter Text Objects

- `af` / `if` - Around/Inside function
- `ac` / `ic` - Around/Inside class
- `aa` / `ia` - Around/Inside parameter

</details>

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin version lock
├── CLAUDE.md                  # Detailed documentation
├── README.md                  # This file
├── docs/
│   └── roadmap.md            # Development roadmap
├── lua/
│   ├── config/
│   │   ├── lazy.lua          # Lazy.nvim bootstrap
│   │   ├── opts.lua          # Neovim options
│   │   ├── autocmds.lua      # Autocommands
│   │   └── keybinds.lua      # Global keybindings
│   └── plugins/
│       ├── init.lua          # Core plugins
│       ├── ui.lua            # UI plugins
│       ├── picker.lua        # Snacks picker
│       ├── lsp.lua           # LSP configuration
│       ├── completion.lua    # blink.cmp setup
│       ├── copilot.lua       # Copilot backend
│       ├── code.lua          # Formatting, search, flash
│       ├── editor.lua        # Editor enhancements
│       ├── git.lua           # Git integration
│       ├── treesitter.lua    # Treesitter config
│       ├── which-key.lua     # Keybinding discovery
│       ├── lualine.lua       # Statusline
│       ├── mini.lua          # Mini.nvim modules
│       └── trouble.lua       # Diagnostics UI
```

## Customization

### Adding a New Language Server

1. Add to mason-lspconfig in `lua/plugins/lsp.lua`:

```lua
ensure_installed = {
  "your_lsp_here",
  -- ... other servers
},
```

2. Configure the server:

```lua
vim.lsp.config("your_lsp_here", {
  settings = {
    -- Your settings
  },
})
```

3. Restart Neovim - Mason will auto-install

### Adding a Formatter

Edit `lua/plugins/code.lua`:

```lua
formatters_by_ft = {
  your_filetype = { "your_formatter" },
}
```

Add to mason-tool-installer:

```lua
ensure_installed = {
  "your_formatter",
}
```

### Changing Theme

Edit `lua/plugins/ui.lua`:

```lua
require("rose-pine").setup({
  variant = "moon",  -- Change to: moon, main, or dawn
})
```

### Disabling Format on Save

```vim
:FormatDisable        " Globally
:FormatDisable!       " Current buffer only
```

## Troubleshooting

### Plugins not installing

```vim
:Lazy sync
:Lazy clean
```

### LSP not working

```vim
:LspInfo              " Check LSP status
:Mason                " Check installed servers
:checkhealth          " Full health check
```

### Copilot not working

```vim
:Copilot auth         " Re-authenticate
:Copilot status       " Check status
```

### Slow startup

```vim
:Lazy profile         " Check plugin load times
```

## Credits

ZenVim is built on the shoulders of giants:

- [LazyVim](https://github.com/LazyVim/LazyVim) - Configuration inspiration
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - Best practices
- [Neovim](https://neovim.io/) - The editor
- All plugin authors - Thank you! ❤️

## License

MIT License - See [LICENSE](LICENSE) for details

---

**Maintained by:** [drucial](https://github.com/drucial)

**Questions?** Open an issue on [GitHub](https://github.com/drucial/zen-vim/issues)
