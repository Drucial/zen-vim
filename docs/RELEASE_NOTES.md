# Release Notes

## v0.1.0 - Initial Release (2024-10-24)

> **ZenVim's first public release** - A modern, performant Neovim configuration focused on simplicity, speed, and an exceptional developer experience.

### 🎉 What's New

This is the initial release of ZenVim, featuring a complete, production-ready Neovim configuration built from the ground up with modern best practices.

### ✨ Core Features

#### Performance
- ⚡ **Sub-50ms startup time** with strategic lazy loading
- 🦀 **Rust-based plugins** (blink.cmp) for maximum performance
- 📦 **Optimized plugin selection** - one tool per job, no redundancy

#### Developer Experience
- 🤖 **GitHub Copilot Integration** - AI-powered completions via blink.cmp
- 🎯 **12 Pre-configured LSP servers** - TypeScript, Python, Ruby, Lua, and more
- 📝 **Smart Completion** - Sub-4ms completion updates with context-aware suggestions
- 🔧 **Format on Save** - Automatic code formatting with conform.nvim

#### User Interface
- 🎨 **Rose Pine Theme** - Beautiful, low-contrast color scheme (moon variant)
- 📊 **Custom Statusline** - lualine with breadcrumb navigation and git integration
- 🔔 **Enhanced Notifications** - nvim-notify + noice.nvim for beautiful messages
- 📜 **Visual Scrollbar** - Diagnostic and search indicators

#### Navigation & Search
- 🔍 **Snacks Picker** - Fast fuzzy finder for files, grep, LSP symbols, and more
- ⚡ **Flash.nvim** - Quick jump navigation with search labels
- 🌳 **Treesitter Integration** - Smart text objects and incremental selection
- 🗂️ **Oil.nvim** - Edit your filesystem like a buffer

#### Git Integration
- 🔀 **GitSigns** - Inline git change indicators with blame and diff
- 💻 **LazyGit Integration** - Full-featured git UI
- 📝 **Hunk Operations** - Stage, reset, and preview hunks with ease

#### Code Intelligence
- 🔎 **Trouble.nvim** - Beautiful diagnostics and quickfix lists
- 📍 **Todo Comments** - Highlight and navigate TODO/FIXME/NOTE comments
- 🔄 **Grug-far** - Visual search and replace across files
- 🌲 **Treesitter Text Objects** - Select and navigate functions, classes, parameters

### 📦 Included Plugins (40+)

<details>
<summary><b>Full Plugin List</b></summary>

**Core & UI:**
- rose-pine/neovim
- nvim-tree/nvim-web-devicons
- stevearc/dressing.nvim
- knubie/vim-kitty-navigator
- stevearc/oil.nvim
- rcarriga/nvim-notify
- folke/noice.nvim
- folke/snacks.nvim
- petertriho/nvim-scrollbar
- nvim-lualine/lualine.nvim

**Completion & AI:**
- saghen/blink.cmp
- giuxtaposition/blink-cmp-copilot
- zbirenbaum/copilot.lua
- rafamadriz/friendly-snippets

**LSP & Language Support:**
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim
- neovim/nvim-lspconfig

**Code Quality:**
- stevearc/conform.nvim
- WhoIsSethDaniel/mason-tool-installer.nvim

**Editor Enhancements:**
- nvim-treesitter/nvim-treesitter
- nvim-treesitter/nvim-treesitter-textobjects
- windwp/nvim-ts-autotag
- echasnovski/mini.nvim (pairs, surround, comment, bufremove, icons)
- folke/flash.nvim
- MagicDuck/grug-far.nvim
- folke/todo-comments.nvim

**Git:**
- lewis6991/gitsigns.nvim
- kdheepak/lazygit.nvim

**Utilities:**
- folke/which-key.nvim
- folke/trouble.nvim
- nvim-lua/plenary.nvim

</details>

### 🛠️ Language Support

**12 Pre-configured LSP Servers:**
- TypeScript/JavaScript (ts_ls + eslint)
- Ruby/Rails (ruby_lsp)
- Python (pyright)
- Lua (lua_ls)
- Bash (bashls)
- Tailwind CSS (tailwindcss)
- Prisma (prismals)
- Markdown (marksman)
- JSON (jsonls)
- HTML (html)
- CSS (cssls)

**7 Pre-configured Formatters:**
- Prettier (TS/JS/CSS/HTML/JSON/YAML/MD)
- eslint_d (TS/JS auto-fix)
- stylua (Lua)
- black + isort (Python)
- rubocop (Ruby)
- shfmt (Shell)

### 📚 Documentation

- ⌨️ **[Keybindings Reference](keybinds.md)** - Complete guide with 16 categories
- 📖 **[Development Roadmap](roadmap.md)** - Feature tracking and future plans
- 🤖 **[CLAUDE.md](../CLAUDE.md)** - Detailed architecture documentation

### 🎯 Philosophy

ZenVim is built on three core principles:

1. **Performance First** - Lazy loading, modern plugins, minimal overhead
2. **Simplicity & Clarity** - One tool per job, intuitive keybindings
3. **Developer Experience** - AI-powered completion, comprehensive LSP support

### 📋 Requirements

- Neovim >= 0.11.0
- Node.js >= 18.x (for Copilot)
- Git
- A Nerd Font (recommended: JetBrainsMono Nerd Font)
- ripgrep (for grep functionality)
- fd (optional, for faster file finding)

### 🚀 Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone ZenVim
git clone https://github.com/drucial/zen-vim.git ~/.config/nvim

# Launch Neovim (plugins auto-install)
nvim
```

First launch takes 2-3 minutes for plugin installation. Restart after completion.

### 🎨 Key Highlights

**Intuitive Keybindings:**
- `<Space>` - Leader key with which-key discovery
- `<leader>ff` - Find files
- `<leader>fs` - Live grep
- `<leader>gg` - LazyGit
- `gd` - Go to definition
- `<leader>ca` - Code actions
- `s` - Flash jump

**Smart Defaults:**
- Format on save (toggleable with `:FormatDisable`)
- Auto-install LSP servers and formatters
- Hidden files visible in pickers
- Centered scrolling and search results
- Ghost text for AI suggestions

### 🔮 What's Next

See our [roadmap](roadmap.md) for planned features including:
- Debug Adapter Protocol (nvim-dap) support
- Snippet engine integration
- Testing framework integration
- Window management improvements (edgy.nvim)

### 🙏 Credits

Built with inspiration from:
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- The amazing Neovim plugin ecosystem

### 📝 License

MIT License - See [LICENSE](../LICENSE) for details

---

**Full Changelog**: https://github.com/drucial/zen-vim/commits/v0.1.0
