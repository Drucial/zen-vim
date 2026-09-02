vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- GUI launches (Neovide, Finder) never source the shell profile, so binaries
-- here would be missing from anything nvim spawns.
local local_bin = vim.fn.expand("~/.local/bin")
if not vim.env.PATH:find(local_bin, 1, true) then
  vim.env.PATH = local_bin .. ":" .. vim.env.PATH
end

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "no"
opt.fillchars:append({ eob = " " })
opt.breakindent = true
opt.swapfile = false

-- Set here rather than per-plugin so it survives theme switches.
opt.winborder = "rounded"

-- Live :s preview, with a split listing every affected line.
opt.inccommand = "split"

-- Full message below the cursor line only, so nothing renders until you land on
-- a diagnostic. Long tsserver messages survive intact, which virtual text truncates.
vim.diagnostic.config({
  virtual_lines = { current_line = true },
})

-- Default status bar
opt.laststatus = 3
opt.ruler = false
opt.showmode = false
opt.cmdheight = 0

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftround = true

-- System clipboard
opt.clipboard = "unnamedplus"

-- Centered cursor (keeps cursor in middle of screen)
opt.scrolloff = 999

-- Better horizontal scroll context
opt.sidescrolloff = 16

-- Silence all bells (no macOS funk sound on unmapped keys in neovide)
opt.belloff = "all"
opt.visualbell = false
