# 🎨 Tailwind CSS Setup - Enhanced Configuration

## ✅ What's Configured

Your Tailwind LSP is now fully optimized for the best DX possible!

### 🔧 Features Enabled

1. **✅ IntelliSense & Autocomplete**
   - Class name suggestions as you type
   - Works in all string contexts (className, class, classList, etc.)

2. **✅ Color Decorators**
   - Visual color squares next to Tailwind color classes
   - Powered by `nvim-highlight-colors` with `enable_tailwind = true`

3. **✅ Linting & Validation**
   - Warns about CSS conflicts (e.g., `flex flex-col` conflicts)
   - Errors for invalid Tailwind directives
   - Warns when variants are in wrong order

4. **✅ Hover Documentation**
   - Press `K` on any Tailwind class to see:
     - Generated CSS
     - Color preview (for color classes)
     - Spacing values
     - Full utility documentation

5. **✅ CSS-in-JS Support**
   - `tw` template literals (styled-components, emotion)
   - `cx()`, `clsx()`, `classnames()` utilities
   - Conditional class objects

---

## 🎯 Supported Patterns

Your config recognizes Tailwind classes in:

### Standard JSX/TSX
```tsx
<div className="flex items-center gap-4">
<div class="flex items-center gap-4">
```

### Template Literals (tw``)
```tsx
const styles = tw`flex items-center gap-4`
const Button = styled.button`${tw`px-4 py-2`}`
```

### Class Utilities
```tsx
cx('flex', isActive && 'bg-blue-500')
clsx('flex', { 'bg-blue-500': isActive })
classnames('flex', { 'bg-blue-500': isActive })
```

### Conditional Classes
```tsx
class:list={['flex', isActive && 'bg-blue-500']}
```

---

## 🚀 Usage Tips

### 1. **Get Completions**
Just start typing in a class attribute:
```tsx
className="flex |" // Cursor here, start typing
```
You'll see all Tailwind utilities!

### 2. **View Hover Info**
Place cursor on any Tailwind class and press `K`:
```tsx
className="bg-blue-500" // Press K here
                  ↑
```
You'll see:
- Generated CSS: `background-color: rgb(59 130 246)`
- Color preview
- Full documentation

### 3. **Check for Conflicts**
Tailwind LSP warns about conflicting classes:
```tsx
// ⚠️ Warning: These conflict
className="flex block" // Can't be both flex and block!
```

### 4. **See Colors Inline**
With `nvim-highlight-colors`, you'll see color squares:
```tsx
className="bg-blue-500 text-red-600"
              ⬛ blue    ⬛ red
```

### 5. **Sort Classes (Optional)**
Tailwind LSP suggests proper variant order:
```tsx
// ⚠️ Warning: Wrong order
className="bg-blue-500 hover:bg-blue-600 md:bg-blue-700"

// ✅ Correct order
className="bg-blue-500 md:bg-blue-700 hover:bg-blue-600"
```

---

## 📋 Keybindings (from LSP)

| Key | Action | Use Case |
|-----|--------|----------|
| `K` | Hover documentation | See CSS for Tailwind class |
| `gd` | Go to definition | Jump to Tailwind config (if customized) |
| `<leader>ca` | Code actions | Quick fixes for Tailwind issues |

---

## 🔍 Validation & Linting

Your config validates:

| Issue | Level | Example |
|-------|-------|---------|
| CSS conflicts | Warning | `flex block` |
| Invalid @apply | Error | `@apply not-a-class` |
| Invalid config path | Error | Wrong `tailwind.config.js` location |
| Invalid screen | Error | `md:lg:flex` (nested breakpoints) |
| Invalid directive | Error | `@tailwind unknown` |
| Invalid variant | Error | `unknownvariant:flex` |
| Variant order | Warning | `hover:md:flex` (should be `md:hover:flex`) |

---

## 🎨 Color Decorator Settings

Your `nvim-highlight-colors` is configured for optimal Tailwind support:

```lua
render = "virtual",           -- Shows colors as virtual text (less intrusive)
enable_tailwind = true,       -- Recognizes Tailwind color classes
enable_named_colors = true,   -- Also shows named colors (red, blue, etc.)
```

You can change `render` mode:
- `"virtual"` - Color square at end of line (recommended)
- `"background"` - Highlights text background
- `"foreground"` - Changes text color

---

## 🐛 Troubleshooting

### "No Tailwind completions showing"

1. **Check Tailwind config exists:**
   ```bash
   # Must have one of these:
   tailwind.config.js
   tailwind.config.cjs
   tailwind.config.mjs
   tailwind.config.ts
   ```

2. **Check LSP attached:**
   ```vim
   :LspInfo
   ```
   You should see `tailwindcss` in the list.

3. **Check file type recognized:**
   ```vim
   :lua =vim.bo.filetype
   ```
   Should be: `typescriptreact`, `javascriptreact`, etc.

### "Colors not showing"

1. **Restart Neovim** after config change
2. **Check nvim-highlight-colors loaded:**
   ```vim
   :lua =require('nvim-highlight-colors')
   ```

### "Hover shows nothing"

Make sure you have a `tailwind.config.js` - Tailwind LSP needs it to provide hover info.

---

## 🔥 Pro Tips

### Tip 1: Custom Config Location
If your `tailwind.config.js` is in a non-standard location, add to your project root:

```json
// .vscode/settings.json (LSP will read this)
{
  "tailwindCSS.experimental.configFile": "./config/tailwind.config.js"
}
```

### Tip 2: Add Custom Class Attributes
If you use custom props for classes, add them to LSP config in `lsp.lua`:

```lua
classAttributes = {
  "class",
  "className",
  "classList",
  "ngClass",
  "myCustomClassProp", -- Add your custom attribute
},
```

### Tip 3: Disable Validation Temporarily
If Tailwind linting is too aggressive:

```vim
:lua vim.lsp.stop_client(vim.lsp.get_active_clients({ name = "tailwindcss" }))
```

### Tip 4: Quick Tailwind Class Lookup
Use Snacks picker to search Tailwind classes:
```vim
<leader>ss  " Search symbols - includes Tailwind utilities
```

---

## 📊 Summary

Your Tailwind setup now includes:

- ✅ Full IntelliSense in all contexts (JSX, template literals, utilities)
- ✅ Visual color decorators inline
- ✅ Hover documentation with CSS output
- ✅ Conflict detection and warnings
- ✅ Variant order suggestions
- ✅ Support for CSS-in-JS patterns
- ✅ Custom attribute recognition

**Result:** Best-in-class Tailwind DX in Neovim! 🎉

---

## 🔗 References

- [Tailwind CSS IntelliSense](https://github.com/tailwindlabs/tailwindcss-intellisense)
- [nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)
