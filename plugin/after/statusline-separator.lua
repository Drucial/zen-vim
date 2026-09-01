-- laststatus=0 hides the last statusline, but stacked windows still draw one as
-- their divider. Render it as a plain rule matching the window separator.

local function apply()
  vim.api.nvim_set_hl(0, "StatusLine", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { link = "WinSeparator" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("StatuslineSeparator", { clear = true }),
  callback = apply,
})

apply()
