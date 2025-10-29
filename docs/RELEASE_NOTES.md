# Release Notes

## 2025-10-29 - Major Completion & Performance Update

### 🚀 New Features

**Supermaven Integration**
- Replaced GitHub Copilot with Supermaven for significantly faster AI-powered inline completions
- **Benefits:**
  - Much faster response times (no noticeable lag)
  - Cleaner integration without extra dependencies
  - Same keybindings: `<Tab>` to accept, `<C-]>` to dismiss
  - Bonus: `<C-j>` to accept just the next word
- Configuration: `lua/plugins/supermaven.lua`

### ⚡ Performance Improvements

**Treesitter Highlighting Fix**
- Fixed TypeScript/TSX syntax highlighting initialization issues
- **Changes:**
  - Treesitter now loads immediately (`lazy = false`) with high priority
  - Added explicit `vim.treesitter.start()` call on FileType (LazyVim approach)
  - Highlighting now works correctly from the moment you open a file
- **Result:** No more need to manually toggle highlighting for TS/TSX files

### 🔧 Configuration Improvements

**blink.cmp Optimization**
- Removed Copilot integration from completion menu
- Disabled ghost text to prevent conflicts with Supermaven
- Disabled auto-preselection and auto-insert for less intrusive behavior
- Added arrow key navigation (`<Up>`/`<Down>`)
- **Result:** Clean separation between AI suggestions (Supermaven) and LSP completions (blink.cmp)

**ESLint Flat Config Support**
- Added support for new ESLint flat config format in conform.nvim
- Now detects `eslint.config.mjs`, `eslint.config.cjs`, and `eslint.config.js`
- Still supports legacy `.eslintrc*` formats
- **Result:** ESLint auto-fix now works with modern project configurations

### 📝 Completion Workflow

**New Workflow:**
1. **AI Suggestions (Supermaven):** Inline gray text appears as you type
   - `<Tab>` - Accept full suggestion
   - `<C-j>` - Accept next word
   - `<C-]>` - Dismiss

2. **LSP Completions (blink.cmp):** Menu appears automatically while typing
   - `<Up>`/`<Down>` or `<C-n>`/`<C-p>` - Navigate
   - `<CR>` - Accept (only if you've selected something)
   - `<C-e>` - Close menu
   - `<C-Space>` - Manually trigger

**Sources priority:** LSP → Path → Snippets → Buffer

### 🗑️ Removed

- `copilot.lua` - Replaced by Supermaven
- `blink-cmp-copilot` - No longer needed
- Copilot-related dependencies and configuration

### 📚 Documentation Updates

- Updated `CLAUDE.md` with Supermaven information
- Updated `README.md` plugin list and keybindings
- Removed Copilot authentication steps
- Added Supermaven keybinding documentation

### 🔄 Migration Notes

**If you're updating from a previous version:**

1. Run `:Lazy sync` to install Supermaven and remove old plugins
2. Restart Neovim
3. Treesitter highlighting should work immediately (no manual toggling needed)
4. ESLint auto-fix should work with flat config projects

**No action needed for:**
- Existing keybindings (Tab still accepts AI suggestions)
- LSP configurations (unchanged)
- Other formatters (unchanged)

### 🎯 Technical Details

**Files Modified:**
- `lua/plugins/blink-cmp.lua` - Removed Copilot, optimized for Supermaven coexistence
- `lua/plugins/supermaven.lua` - **New file** with Supermaven configuration
- `lua/plugins/conform.lua` - Added flat config detection for eslint_d
- `lua/plugins/treesitter.lua` - Changed loading strategy and added explicit highlighting initialization
- `lua/plugins/copilot.lua` - **Deleted**

**Configuration Philosophy:**
- **Separation of Concerns:** AI suggestions (Supermaven) vs LSP completions (blink.cmp)
- **No Interference:** Ghost text disabled, no auto-preselection
- **Performance First:** Treesitter loads immediately but efficiently
- **Modern Standards:** Support for latest ESLint flat config format

---

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
