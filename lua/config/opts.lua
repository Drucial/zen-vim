vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.laststatus = 3
opt.ruler = false
opt.showmode = false
opt.cmdheight = 0
opt.signcolumn = "number"
opt.fillchars:append({ eob = " " })

-- System clipboard
opt.clipboard = "unnamedplus"

-- Centered cursor (keeps cursor in middle of screen)
opt.scrolloff = 999

-- Better horizontal scroll context
opt.sidescrolloff = 16

-- Silence all bells (no macOS funk sound on unmapped keys in neovide)
opt.belloff = "all"
opt.visualbell = false
