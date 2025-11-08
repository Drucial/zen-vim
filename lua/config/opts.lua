-- Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Mouse support
opt.mouse = "a"

-- Don't show mode in command line (shown in statusline)
opt.showmode = false

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false
opt.breakindent = true
opt.linebreak = true -- Wrap at word boundaries, never split words in the middle

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " } -- Remove tildes on empty lines

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable swapfile
opt.swapfile = false

-- Undo
opt.undofile = true
opt.undolevels = 10000

-- Update time
opt.updatetime = 250

-- Timeout for key sequences
opt.timeoutlen = 300

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Scrolling
opt.scrolloff = 999
opt.sidescrolloff = 16

-- Preview substitutions live
opt.inccommand = "split"

-- Confirm before closing unsaved files
opt.confirm = true

-- Folding (treesitter-based)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99 -- Start with all folds open
opt.foldlevelstart = 99 -- Start with all folds open
opt.foldenable = true

-- Performance optimizations
opt.synmaxcol = 240 -- Only syntax highlight first 240 columns (helps with very long lines)

-- Cleaner UI
opt.cmdheight = 0 -- Hide command line when not in use (Noice handles messages)
