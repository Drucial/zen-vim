# 🔍 Tailwind LSP Hover Not Working - Diagnosis & Fix

## 🎯 Problem Identified

You're using **Tailwind CSS v4** which:
- Uses `@tailwindcss/postcss` plugin (no `tailwind.config.js`)
- Configures everything in CSS (`@import "tailwindcss"`
- **The Tailwind LSP doesn't fully support v4 yet!**

This is why `K` (hover) shows nothing for Tailwind classes.

---

## ✅ Quick Fixes (Choose One)

### Option 1: Add Tailwind v4 Support Flag (Experimental)

The Tailwind LSP has experimental v4 support. Update your LSP config:

**In `lua/plugins/lsp.lua`, replace the Tailwind section with:**

```lua
-- Tailwind CSS - With v4 support
vim.lsp.config("tailwindcss", {
	-- Ensure Tailwind attaches to these file types
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
	init_options = {
		userLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
		},
	},
	root_dir = function(fname)
		-- Look for v4 indicators OR v3 config
		local root = vim.fs.root(fname, {
			"postcss.config.js",
			"postcss.config.mjs",
			"postcss.config.cjs",
			"tailwind.config.js",
			"tailwind.config.ts",
			"tailwind.config.mjs",
		})
		return root
	end,
	settings = {
		tailwindCSS = {
			-- Experimental v4 support
			experimental = {
				-- Enable v4 support
				configFile = nil,
				-- Support for v4 CSS-based config
				classRegex = {
					-- Standard
					"class:\\s*[\"'`]([^\"'`]*)[\"'`]",
					"className\\s*=\\s*[\"'`]([^\"'`]*)[\"'`]",
					-- tw`` template literals
					"tw`([^`]*)",
					"tw=\"([^\"]*)",
					'tw={"([^"}]*)',
					"tw\\.\\w+`([^`]*)",
					"tw\\(.*?\\)`([^`]*)",
					-- cx/clsx/classnames
					{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "classnames\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
				},
			},
			-- Completion suggestions
			suggestions = true,
			-- Color decorators
			colorDecorators = true,
			-- Validate Tailwind classes
			validate = true,
			-- Class attributes
			classAttributes = {
				"class",
				"className",
				"classList",
				"ngClass",
			},
		},
	},
})
```

**Then restart Neovim and test.**

---

### Option 2: Create a Compatibility Config (Recommended for Now)

Until Tailwind LSP fully supports v4, create a minimal v3-style config for the LSP:

**Create `tailwind.config.ts` in your project root:**

```typescript
import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

export default config
```

This doesn't affect your v4 setup (PostCSS still uses `@tailwindcss/postcss`), but gives the LSP something to read.

**Then restart Neovim.**

---

### Option 3: Wait for Full v4 Support

The Tailwind team is working on full v4 LSP support. Track progress:
- https://github.com/tailwindlabs/tailwindcss-intellisense/issues

In the meantime, you still get:
- ✅ Completions (works in v4)
- ✅ Color decorators (works in v4)
- ❌ Hover docs (not working yet)

---

## 🧪 Testing the Fix

After applying a fix:

1. **Restart Neovim completely**
2. **Open a TSX file with Tailwind classes**
3. **Check LSP attached:**
   ```vim
   :LspInfo
   ```
   Should show `tailwindcss` as attached

4. **Test hover:**
   ```tsx
   className="bg-blue-500"
             ↑ Place cursor here, press K
   ```

5. **Test completions:**
   ```tsx
   className="bg-|" // Should show completions
   ```

---

## 🔍 Debugging Steps

### 1. Check if Tailwind LSP is attached:
```vim
:LspInfo
```

**Look for:**
```
Client: tailwindcss (id: X, bufnr: [Y])
  filetypes:       typescriptreact, javascriptreact, typescript, javascript
  root directory:  /Users/drucial/Dev/shad-zen
```

### 2. Check LSP logs:
```vim
:lua vim.cmd('edit ' .. vim.lsp.get_log_path())
```

Search for "tailwindcss" to see any errors.

### 3. Check if file is recognized:
```vim
:lua =vim.bo.filetype
```

Should return: `typescriptreact`, `javascriptreact`, etc.

### 4. Manually trigger hover:
```vim
:lua vim.lsp.buf.hover()
```

If nothing shows, the LSP isn't providing hover info.

---

## 🎯 Current Status (Tailwind v4)

| Feature | Status | Notes |
|---------|--------|-------|
| Completions | ✅ Works | Classes suggest as you type |
| Color decorators | ✅ Works | Visual color squares |
| Hover docs | ❌ Limited | LSP doesn't support v4 config yet |
| Linting | ⚠️ Partial | Some validation works |
| Conflict detection | ⚠️ Partial | May not catch all conflicts |

---

## 💡 Workaround: Use Tailwind Docs

While waiting for full v4 LSP support, use these alternatives:

### 1. **Tailwind Online Docs**
Press `<leader>gB` (Git Browse copy) on a class, then manually search:
https://tailwindcss.com/docs

### 2. **Quick Command to Open Docs**
Add to `keybinds.lua`:

```lua
-- Open Tailwind docs for class under cursor
keymap.set("n", "<leader>cT", function()
  local word = vim.fn.expand("<cword>")
  local url = "https://tailwindcss.com/docs/" .. word:gsub("%-", "-")
  vim.fn.system({ "open", url })
end, { desc = "Tailwind Docs for Class" })
```

### 3. **Use `:help` for CSS Properties**
For basic CSS, you can still use Neovim's built-in help:
```vim
:help css
```

---

## 🚀 Recommended Solution

**For immediate hover functionality:**

1. ✅ Create `tailwind.config.ts` (Option 2 above)
2. ✅ Keep your v4 PostCSS setup as-is
3. ✅ Restart Neovim
4. ✅ Test hover with `K`

This gives you:
- ✅ Full LSP support (completions, hover, validation)
- ✅ Your v4 setup still works (PostCSS ignores the config file)
- ✅ Best of both worlds until v4 LSP support is complete

---

## 📋 Summary

**The issue:** Tailwind v4 doesn't use `tailwind.config.js`, and the LSP needs it for hover docs.

**The fix:** Create a minimal `tailwind.config.ts` for the LSP to read (doesn't affect your v4 build).

**Alternative:** Wait for official v4 LSP support (track on GitHub).

---

**Once you apply the fix, hover should work! Let me know if you need help implementing it.**
