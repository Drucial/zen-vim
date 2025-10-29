# ZenVim Keybindings Reference

> Complete reference guide for all keybindings in ZenVim

**Leader Key:** `<Space>`

**Quick Access:** Press `<Space>` and wait 500ms to see all available leader keybindings with which-key.

---

## Table of Contents

- [General Keybindings](#general-keybindings)
- [Navigation](#navigation)
- [Window Management](#window-management)
- [Buffer Management](#buffer-management)
- [Finding & Searching](#finding--searching)
- [LSP (Language Server Protocol)](#lsp-language-server-protocol)
- [Code Actions](#code-actions)
- [Git Operations](#git-operations)
- [Treesitter](#treesitter)
- [Completion](#completion)
- [Diagnostics (Trouble)](#diagnostics-trouble)
- [Search & Replace](#search--replace)
- [Surround](#surround)
- [Flash Navigation](#flash-navigation)
- [Todo Comments](#todo-comments)
- [Messages & Notifications (Noice)](#messages--notifications-noice)
- [File Browser (Oil)](#file-browser-oil)
- [UI Toggles](#ui-toggles)
- [Tips & Tricks](#tips--tricks)

---

## General Keybindings

### Insert Mode

| Key | Action | Description |
|-----|--------|-------------|
| `jk` | Exit to normal mode | Quick escape from insert mode |
| `<C-Space>` | Toggle completions | Show/hide completion menu (blink.cmp) |
| `<CR>` (Enter) | Accept completion | Accept the selected completion item |
| `<C-y>` | Force accept | Force accept current completion item |
| `<C-n>` / `<C-p>` | Navigate completions | Move down/up through completion menu |
| `<C-e>` | Hide completions | Close the completion menu |
| `<C-k>` | Signature help | Show function signature help |

### Normal Mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Esc>` | Clear highlights | Clear search highlights |
| `<C-d>` / `<C-u>` | Scroll & center | Scroll down/up half page and center cursor |
| `<C-Down>` / `<C-Up>` | Scroll & center | Alternative scroll down/up and center |
| `n` / `N` | Search & center | Next/previous search result (centered) |
| `<A-S-Down>` / `<A-S-Up>` | Move line | Move current line down/up |
| `<C-S-Down>` / `<C-S-Up>` | Duplicate line | Duplicate current line down/up |
| `<C-Space>` | Start selection | Start Treesitter incremental selection |
| `c` / `C` | Change without yank | Change text without copying to clipboard |
| `K` | Hover documentation | Show LSP hover information |
| `gK` | Signature help | Show function signature |
| `-` | Open parent directory | Launch oil.nvim file browser |

### Visual Mode

| Key | Action | Description |
|-----|--------|-------------|
| `<` / `>` | Indent | Indent left/right (maintains selection) |
| `<A-S-Down>` / `<A-S-Up>` | Move lines | Move selected lines down/up |
| `<C-S-Down>` / `<C-S-Up>` | Duplicate lines | Duplicate selected lines down/up |
| `<C-Space>` | Expand selection | Expand to next Treesitter node |
| `<bs>` (Backspace) | Shrink selection | Shrink to previous Treesitter node |
| `c` / `C` | Change without yank | Change text without copying to clipboard |
| `<leader>p` | Paste without yank | Paste without overwriting clipboard |
| `<leader>d` | Delete without yank | Delete without copying to clipboard |

### Terminal Mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Esc><Esc>` | Exit terminal mode | Return to normal mode from terminal |
| `<A-\>` | Toggle terminal | Open/close floating terminal (works in normal and terminal mode) |

---

## Navigation

### Split & Terminal Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Navigate left | Move to left split or Kitty pane |
| `<C-j>` | Navigate down | Move to split below or Kitty pane |
| `<C-k>` | Navigate up | Move to split above or Kitty pane |
| `<C-l>` | Navigate right | Move to right split or Kitty pane |

> **Note:** Navigation keys are handled by `vim-kitty-navigator` for seamless integration with Kitty terminal.

### Hunk Navigation (Git)

| Key | Action | Description |
|-----|--------|-------------|
| `]h` / `[h` | Next/Prev hunk | Jump to next/previous git change |
| `]H` / `[H` | Last/First hunk | Jump to last/first git change |

### Function & Class Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `]f` / `[f` | Next/Prev function | Jump to next/previous function start |
| `]F` / `[F` | Function end | Jump to next/previous function end |
| `]c` / `[c` | Next/Prev class | Jump to next/previous class start |
| `]C` / `[C` | Class end | Jump to next/previous class end |

### Diagnostic Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `]d` / `[d` | Next/Prev diagnostic | Jump to next/previous diagnostic |

### Todo Comment Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `]t` / `[t` | Next/Prev todo | Jump to next/previous TODO comment |

---

## Window Management

All window commands use the `<leader>w` prefix.

### Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>wh` | Go to left window | Move focus to window on the left |
| `<leader>wj` | Go to lower window | Move focus to window below |
| `<leader>wk` | Go to upper window | Move focus to window above |
| `<leader>wl` | Go to right window | Move focus to window on the right |
| `<leader>ww` | Switch windows | Toggle between current and previous window |
| `<leader>wH` | Move window far left | Move current window to far left |
| `<leader>wJ` | Move window far down | Move current window to bottom |
| `<leader>wK` | Move window far up | Move current window to top |
| `<leader>wL` | Move window far right | Move current window to far right |

### Splits

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ws` | Split below | Create horizontal split below |
| `<leader>wv` | Split right | Create vertical split to the right |
| `<leader>w-` | Split below | Alternative horizontal split |
| `<leader>w\|` | Split right | Alternative vertical split |

### Close/Quit

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>wd` | Delete window | Close current window |
| `<leader>wq` | Quit window | Quit current window |
| `<leader>wo` | Close others | Close all other windows |

### Resize

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>w+` | Increase height | Increase window height by 2 rows |
| `<leader>w-` | Decrease height | Decrease window height by 2 rows |
| `<leader>w>` | Increase width | Increase window width by 2 columns |
| `<leader>w<` | Decrease width | Decrease window width by 2 columns |
| `<leader>w=` | Equalize windows | Make all windows equal size |

### Maximize

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>w_` | Maximize height | Maximize current window height |
| `<leader>w\|` | Maximize width | Maximize current window width |

### Swap & Zoom

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>wx` | Swap with next | Swap current window with next |
| `<leader>wm` | Zoom toggle | Toggle zoom mode (maximize/restore) |

---

## Buffer Management

Buffer commands use the `<leader>b` prefix.

| Key | Action | Description |
|-----|--------|-------------|
| `<leader><leader>` | List buffers | Quick buffer picker (duplicate of `<leader>bb`) |
| `<leader>bb` | List buffers | Open buffer picker |
| `<leader>bd` | Delete buffer | Close current buffer |
| `<leader>bn` | Next buffer | Switch to next buffer |
| `<leader>bp` | Previous buffer | Switch to previous buffer |
| `<leader>bw` | Write buffer | Save current buffer |

---

## Finding & Searching

All finder commands use the `<leader>f` prefix (powered by Snacks picker).

### File Finding

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ff` | Find files | Fuzzy find files in current directory |
| `<leader>fr` | Recent files | Find recently opened files |
| `<leader>fc` | Config files | Find files in Neovim config directory |
| `<leader>fp` | Find projects | Find projects in ~/Dev directory |

### Content Search

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>fs` | Find string | Live grep search across files |
| `<leader>fw` | Find word | Search for word under cursor |
| `<leader>/` | Buffer search | Fuzzy search in current buffer |

### Help & Reference

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>fh` | Find help | Search Neovim help tags |
| `<leader>fH` | Find highlights | Search highlight groups |
| `<leader>fC` | Find commands | Search available commands |
| `<leader>fk` | Find keymaps | Search configured keybindings |
| `<leader>fd` | Find diagnostics | Search all diagnostics |

---

## Search Commands

LazyVim-style comprehensive search commands using the `<leader>s` prefix (powered by Snacks picker).

### Code & Symbols

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ss` | Buffer symbols | Search LSP symbols in current buffer |
| `<leader>sS` | Workspace symbols | Search LSP symbols across workspace |
| `<leader>sd` | Diagnostics (buffer) | Search diagnostics in current buffer |
| `<leader>sD` | Diagnostics (workspace) | Search diagnostics across workspace |

### Content Search

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sb` | Buffer lines | Search lines in current buffer |
| `<leader>sB` | Grep buffers | Search across all open buffers |
| `<leader>sg` | Grep | Live grep search across files |
| `<leader>sw` | Search word | Search for word under cursor |
| `<leader>sh` | Search help | Search Neovim help pages |

### Editor Components

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sa` | Autocmds | Search autocommands |
| `<leader>sH` | Highlights | Search highlight groups |
| `<leader>si` | Icons | Search available icons |
| `<leader>sj` | Jumps | Search jump list |
| `<leader>sk` | Keymaps | Search configured keymaps |
| `<leader>sl` | Location list | Search location list |
| `<leader>sm` | Marks | Search marks |
| `<leader>sM` | Man pages | Search manual pages |
| `<leader>sq` | Quickfix | Search quickfix list |
| `<leader>s"` | Registers | Search registers |

### History & Commands

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sc` | Command history | Search command history |
| `<leader>s/` | Search history | Search search history |
| `<leader>sC` | Commands | Search available commands |
| `<leader>sR` | Resume | Resume last picker search |

---

## LSP (Language Server Protocol)

LSP keybindings are available when an LSP server is attached to the buffer.

### Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Goto definition | Jump to definition (Snacks picker) |
| `gD` | Goto declaration | Jump to declaration |
| `gr` | References | Show all references (Snacks picker) |
| `gI` | Goto implementation | Jump to implementation (Snacks picker) |
| `gy` | Goto type definition | Jump to type definition (Snacks picker) |

### Documentation

| Key | Action | Description |
|-----|--------|-------------|
| `K` | Hover | Show hover documentation |
| `gK` | Signature help | Show function signature |
| `<C-k>` | Signature help (insert) | Show signature in insert mode |

### Diagnostics

| Key | Action | Description |
|-----|--------|-------------|
| `[d` | Previous diagnostic | Jump to previous diagnostic |
| `]d` | Next diagnostic | Jump to next diagnostic |

> **Tip:** Diagnostics appear in a floating window on cursor hold. Use `<C-f>` and `<C-b>` to scroll in LSP hover/diagnostic windows.

---

## Code Actions

Code action commands use the `<leader>c` prefix.

### Always Available

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>cf` | Format code | Format current buffer (async) |
| `<leader>cl` | LSP info | Show LSP server information |

### When LSP Attached

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<leader>ca` | Code action | n, x | Show available code actions |
| `<leader>cA` | Source action | n | Show source-level code actions |
| `<leader>ci` | Code info | n | Show hover documentation |
| `<leader>cr` | Rename | n | Rename symbol under cursor |
| `<leader>cR` | Rename file | n | Rename current file (LSP-aware) |
| `<leader>cc` | Run codelens | n, x | Execute code lens |
| `<leader>cC` | Refresh codelens | n | Refresh and display code lens |

### Format Commands

| Command | Description |
|---------|-------------|
| `:FormatDisable` | Disable format-on-save globally |
| `:FormatDisable!` | Disable format-on-save for current buffer only |
| `:FormatEnable` | Re-enable format-on-save |

---

## Git Operations

### LazyGit

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gg` | LazyGit | Open LazyGit full UI |

### Git Hunks

All git hunk commands use the `<leader>gh` prefix.

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<leader>ghs` | Stage hunk | n, x | Stage current/selected hunk |
| `<leader>ghr` | Reset hunk | n, x | Reset current/selected hunk |
| `<leader>ghS` | Stage buffer | n | Stage all changes in buffer |
| `<leader>ghu` | Undo stage hunk | n | Undo last hunk staging |
| `<leader>ghR` | Reset buffer | n | Reset all changes in buffer |
| `<leader>ghp` | Preview hunk | n | Preview hunk changes inline |
| `<leader>ghb` | Blame line | n | Show git blame for current line |
| `<leader>ghB` | Blame buffer | n | Show git blame for entire buffer |
| `<leader>ghd` | Diff this | n | Show diff for current buffer |
| `<leader>ghD` | Diff this ~ | n | Show diff against previous commit |

### Git Text Objects

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `ih` | Select hunk | o, x | Select current git hunk (text object) |

**Examples:**
- `vih` - Visual select hunk
- `dih` - Delete hunk
- `yih` - Yank (copy) hunk

---

## Treesitter

### Incremental Selection

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<C-Space>` | Start/Expand selection | n, v | Start selection or expand to next node |
| `<bs>` | Shrink selection | v | Shrink selection to previous node |

### Text Objects

Treesitter text objects work with operators (`d`, `y`, `c`, `v`, etc.).

| Key | Description | Example |
|-----|-------------|---------|
| `af` | Around function | `daf` - Delete function |
| `if` | Inside function | `vif` - Select inside function |
| `ac` | Around class | `yac` - Yank class |
| `ic` | Inside class | `cic` - Change inside class |
| `aa` | Around parameter | `daa` - Delete parameter |
| `ia` | Inside parameter | `via` - Select inside parameter |

**Common Combinations:**
- `vaf` - Visual select around function
- `daf` - Delete entire function
- `yif` - Yank inside function (without function definition)
- `cic` - Change inside class
- `daa` - Delete parameter (including comma)

---

## Completion

Completion is powered by **blink.cmp** with GitHub Copilot integration.

### Completion Keys (Insert Mode)

| Key | Action | Description |
|-----|--------|-------------|
| `<C-Space>` | Show/toggle | Show or hide completion menu |
| `<CR>` (Enter) | Accept | Accept selected completion |
| `<C-y>` | Force accept | Force accept current item |
| `<C-n>` | Next | Move to next completion item |
| `<C-p>` | Previous | Move to previous completion item |
| `<C-e>` | Hide | Close completion menu |

### Completion Sources (Priority Order)

1. **Copilot** - AI-powered suggestions (highest priority)
2. **LSP** - Language server completions
3. **Path** - File path completions
4. **Snippets** - Code snippet completions
5. **Buffer** - Text from current buffer

> **Note:** Ghost text is enabled to show Copilot suggestions inline.

---

## Diagnostics (Trouble)

Diagnostic commands use the `<leader>x` prefix.

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>xx` | Toggle diagnostics | Show all diagnostics (Trouble) |
| `<leader>xX` | Buffer diagnostics | Show diagnostics for current buffer |
| `<leader>xs` | Symbols | Show document symbols |
| `<leader>xl` | LSP references | Show LSP definitions/references |
| `<leader>xL` | Location list | Show location list |
| `<leader>xQ` | Quickfix list | Show quickfix list |
| `<leader>xt` | Todo | Show all TODO comments (Trouble) |
| `<leader>xT` | Todo/Fix/Fixme | Show TODO/FIX/FIXME only (Trouble) |

---

## Search & Replace

### Grug-far (Visual Search & Replace)

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<leader>sr` | Search and replace | n, x | Open visual search/replace interface |

**Features:**
- Visual interface for search and replace across multiple files
- File type filtering (automatically filters by current file extension)
- Preview changes before applying
- Regex support

---

## Surround

Enclose/surround text with quotes, brackets, tags, and more using the `<leader>e` prefix.

### Normal Mode

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ea{motion}{char}` | Surround motion | Add surround to motion (e.g., `<leader>eaw"` wraps word in quotes) |
| `<leader>ea{motion}<tag>` | Surround with tag | Wrap motion with HTML tag (e.g., `<leader>eaw<div>` wraps word in div) |
| `<leader>eA` | Surround line | Add surround to current line |
| `<leader>el{motion}{char}` | Surround on new lines | Add surround to motion with new lines |
| `<leader>eL` | Surround line on new lines | Add surround to current line with new lines |
| `<leader>ed{char}` | Delete surround | Remove surrounding character (e.g., `<leader>ed"` removes quotes) |
| `<leader>edt` | Delete tag | Remove surrounding HTML tag |
| `<leader>edf` | Delete function call | Remove surrounding function call |
| `<leader>ec{old}{new}` | Change surround | Change surround character (e.g., `<leader>ec"'` changes quotes) |
| `<leader>ect<tag>` | Change tag | Change surrounding HTML tag (e.g., `<leader>ect<span>`) |
| `<leader>ecT<tag>` | Change entire tag | Change entire HTML tag including attributes |
| `<leader>ecf` | Change function | Change surrounding function call |
| `<leader>eC{old}{new}` | Change with new lines | Change surround with new lines |

### Visual Mode

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>es{char}` | Surround selection | Wrap selection with character or tag |
| `<leader>est` | Surround with tag | Wrap selection with HTML tag (prompted) |
| `<leader>esf` | Surround with function | Wrap selection with function call (prompted) |
| `<leader>eS{char}` | Surround with new lines | Wrap selection with character on new lines |
| `<leader>eSt` | Surround tag (new lines) | Wrap selection with HTML tag on new lines |
| `<leader>eSf` | Surround function (new lines) | Wrap selection with function call on new lines |

### Insert Mode

| Key | Action | Description |
|-----|--------|-------------|
| `<C-g>s` | Insert surround | Add surround in insert mode |
| `<C-g>S` | Insert surround (line) | Add surround on new lines in insert mode |

**Common Examples:**
- `<leader>eaw"` - Wrap word in double quotes
- `<leader>eaw'` - Wrap word in single quotes
- `<leader>eaw<div>` - Wrap word in `<div></div>` tags
- `<leader>ed"` - Delete surrounding double quotes
- `<leader>edt` - Delete surrounding HTML tag
- `<leader>ec"'` - Change double quotes to single quotes
- `<leader>ect<span>` - Change surrounding tag to `<span>`
- Visual select text, then `<leader>es<div>` - Wrap selection in div tags

---

## Flash Navigation

Quick jump navigation with search labels.

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `s` | Flash | n, x, o | Jump to any visible location |
| `S` | Flash Treesitter | n, x, o | Jump to Treesitter nodes |
| `r` | Remote flash | o | Remote operations |
| `R` | Treesitter search | o, x | Search Treesitter nodes |
| `<C-s>` | Toggle flash | c | Toggle flash search in command mode |

**Examples:**
- Press `s`, then type characters to see jump labels
- Press `S` to jump to function names, classes, etc.

---

## Todo Comments

Find and navigate TODO/FIXME/NOTE/HACK/WARNING comments.

### Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `]t` | Next todo | Jump to next TODO comment |
| `[t` | Previous todo | Jump to previous TODO comment |

### Search

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>st` | Search todos | Find all TODO/HACK/PERF/NOTE/WARNING |
| `<leader>sT` | Search critical | Find TODO/FIX/FIXME only |
| `<leader>xt` | Todo (Trouble) | View all TODOs in Trouble |
| `<leader>xT` | Critical (Trouble) | View TODO/FIX/FIXME in Trouble |

**Recognized Keywords:**
- `TODO:` - Things to do
- `FIXME:` - Things to fix
- `FIX:` - Alternative to FIXME
- `HACK:` - Temporary workarounds
- `WARN:` - Warnings
- `PERF:` - Performance issues
- `NOTE:` - Important notes

---

## Messages & Notifications (Noice)

Commands for managing Neovim messages and notifications.

### Noice Commands

All noice commands use the `<leader>sn` prefix.

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>snl` | Last message | Show last message |
| `<leader>snh` | History | Show message history |
| `<leader>sna` | All messages | Show all messages |
| `<leader>snd` | Dismiss all | Dismiss all notifications |
| `<leader>snt` | Noice picker | Open message picker |

### Special Keys

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<S-Enter>` | Redirect cmdline | c | Redirect command output to split |
| `<C-f>` | Scroll forward | i, n, s | Scroll forward in LSP hover docs |
| `<C-b>` | Scroll backward | i, n, s | Scroll backward in LSP hover docs |

---

## File Browser (Oil)

Oil.nvim allows you to edit your filesystem like a buffer.

| Key | Action | Description |
|-----|--------|-------------|
| `-` | Open parent | Open parent directory in Oil |

**Inside Oil Buffer:**
- Edit filenames directly like text
- `d` to move files to trash
- `<CR>` to open file/directory
- `q` to quit Oil
- Hidden files (dotfiles) are shown by default

---

## UI Toggles

### Zen Mode

Distraction-free coding mode with centered window and hidden UI elements.

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>z` | Toggle Zen Mode | Enter/exit distraction-free mode |

**Features:**
- Hides line numbers (both absolute and relative)
- Hides statusline (lualine)
- Hides tabline
- Hides git signs and diagnostics
- Hides inlay hints
- Centers code window (120 columns)
- Automatically restores settings on exit

**Tips:**
- Use `<leader>z` again to toggle back to normal view
- All UI elements are automatically restored when exiting zen mode
- Perfect for focused writing or reading code

### Terminal

Floating terminal for quick command execution.

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<A-\>` | Toggle terminal | n, t | Open/close floating terminal |

**Features:**
- Floating window design for quick access
- Automatically escapes terminal mode when closing
- Works from both normal and terminal mode
- Perfect for quick git commands, test runs, etc.

---

## AI Tools (Claude Code)

AI-powered coding assistance with Claude Code integration.

### Claude Code Commands

All Claude Code commands use the `<leader>a` prefix.

| Key | Action | Mode | Description |
|-----|--------|------|-------------|
| `<A-l>` | Toggle Claude | n, v | Quick toggle Claude Code (alternative to `<leader>ac`) |
| `<leader>ac` | Toggle Claude | n, v | Open/close Claude Code interface |
| `<leader>af` | Focus Claude | n | Focus Claude Code window |
| `<leader>ar` | Resume Claude | n | Resume previous Claude session |
| `<leader>aC` | Continue Claude | n | Continue last Claude conversation |
| `<leader>ab` | Add buffer | n | Add current buffer to Claude context |
| `<leader>as` | Send to Claude | v | Send selected text to Claude |
| `<leader>as` | Add file | n | Add file from file explorer (Oil/NvimTree/neo-tree) |

### Diff Management

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>aa` | Accept diff | Accept Claude's proposed changes |
| `<leader>ad` | Deny diff | Reject Claude's proposed changes |

**Usage Tips:**
- Use `<A-l>` for fastest access to Claude Code
- Select code in visual mode and use `<leader>as` to send specific context
- Add multiple files with `<leader>ab` before asking questions
- Review diffs carefully before accepting with `<leader>aa`

---

## Tips & Tricks

### Discover Keybindings

1. **Which-Key Menu**: Press `<Space>` and wait to see all leader keybindings
2. **Specific Prefixes**: Press `g`, `[`, or `]` and wait to see related commands
3. **Search Keymaps**: Use `<leader>fk` to search all configured keybindings
4. **Buffer-Local Keys**: Press `<leader>?` to see buffer-specific keybindings

### Useful Combinations

**Quick File Editing:**
```
<leader>ff → type filename → <CR> → edit → <leader>bw
```

**Search and Replace Workflow:**
```
<leader>sr → configure search → preview → apply changes
```

**Git Workflow:**
```
]h → <leader>ghp → <leader>ghs → <leader>gg
(next hunk → preview → stage → commit via LazyGit)
```

**LSP Symbol Navigation:**
```
<leader>xs → select symbol → <CR> → jump to definition
```

**Function Manipulation:**
```
vaf → y → ]f → p
(select function → yank → next function → paste)
```

### Pro Tips

1. **Format Before Save**: `<leader>cf` to format manually before `:w`
2. **Quick Hunk Review**: `]h` repeatedly to review all changes, `<leader>ghp` to preview
3. **Bulk Rename**: Use Oil.nvim (`-`) for visual file renaming
4. **Diagnostic Focus**: `<leader>xx` to see all errors, then navigate with `j`/`k`
5. **Search Project**: `<leader>fs` for live grep, then refine search query
6. **Todo Management**: `<leader>xt` to see all TODOs, plan work accordingly

### Conflict Resolution

Some keys are intentionally not used to avoid conflicts:

- `<Tab>` - Reserved for Copilot ghost text acceptance (when implemented)
- `<C-h/j/k/l>` - Reserved for vim-kitty-navigator
- `<C-Space>` in visual mode - Reserved for Treesitter incremental selection

---

## Summary of Prefixes

| Prefix | Category | Examples |
|--------|----------|----------|
| `<leader>a` | AI (Claude Code) | `ac`, `af`, `ab`, `aa` |
| `<leader>f` | Find/Files | `ff`, `fs`, `fr`, `fH` |
| `<leader>b` | Buffers | `bb`, `bd`, `bn` |
| `<leader>c` | Code | `ca`, `cf`, `cr` |
| `<leader>g` | Git | `gg`, `gh*` |
| `<leader>gh` | Git Hunks | `ghs`, `ghr`, `ghp` |
| `<leader>w` | Windows | `w-`, `w\|`, `wd`, `wh/j/k/l` |
| `<leader>x` | Diagnostics | `xx`, `xs`, `xt` |
| `<leader>s` | Search | `sr`, `st`, `sn*` |
| `<leader>sn` | Noice | `snl`, `snh`, `snd` |
| `g*` | Goto | `gd`, `gr`, `gI` |
| `]*` | Next | `]h`, `]f`, `]d`, `]t` |
| `[*` | Previous | `[h`, `[f`, `[d`, `[t` |

---

## Getting Help

- **In Neovim**: Use `<leader>fh` to search help docs
- **Keybinding Search**: Use `<leader>fk` to find specific keybindings
- **LSP Info**: Use `<leader>cl` to check LSP server status
- **Which-Key**: Press any prefix and wait to see available commands

For more information, see:
- [CLAUDE.md](../CLAUDE.md) - Detailed configuration documentation
- [Roadmap](roadmap.md) - Feature tracking and development plans
- [README.md](../README.md) - Overview and installation guide
