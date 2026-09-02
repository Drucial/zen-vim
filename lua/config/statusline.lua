local M = {}

local MAX_PATH = 50

local MODES = {
  n = { "N", "Directory" },
  i = { "I", "String" },
  v = { "V", "Statement" },
  V = { "V", "Statement" },
  ["\22"] = { "V", "Statement" },
  s = { "S", "Statement" },
  S = { "S", "Statement" },
  R = { "R", "DiagnosticError" },
  c = { "C", "Constant" },
  t = { "T", "Type" },
  no = { "O", "Directory" },
}

local function block_hl(name, source)
  local from = vim.api.nvim_get_hl(0, { name = source, link = false })
  local bg = from.fg
  if not bg then
    return
  end
  vim.api.nvim_set_hl(0, name, {
    bg = bg,
    fg = vim.o.background == "dark" and 0x000000 or 0xffffff,
    bold = true,
  })
end

function M.apply_highlights()
  for _, mode in pairs(MODES) do
    block_hl("StatusMode" .. mode[1], mode[2])
  end
end

local function git_root(buf)
  local cached = vim.b[buf].statusline_git_root
  if cached ~= nil then
    return cached ~= "" and cached or nil
  end
  local name = vim.api.nvim_buf_get_name(buf)
  local root = name ~= "" and vim.fs.root(name, ".git") or nil
  vim.b[buf].statusline_git_root = root or ""
  return root
end

local function shorten(path)
  if #path <= MAX_PATH then
    return path
  end
  local parts = vim.split(path, "/")
  if #parts <= 2 then
    return path
  end
  return parts[1] .. "/…/" .. parts[#parts]
end

local function path()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" or vim.bo[buf].buftype ~= "" then
    return ""
  end
  local root = git_root(buf)
  local rel = root and name:sub(#root + 2) or vim.fn.fnamemodify(name, ":~")
  return shorten(rel)
end

function M.render()
  local mode = MODES[vim.api.nvim_get_mode().mode] or MODES.n
  return table.concat({
    "%#StatusMode" .. mode[1] .. "# " .. mode[1] .. " %*",
    " ",
    path(),
  })
end

function M.setup()
  M.apply_highlights()
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("statusline-highlights", { clear = true }),
    callback = M.apply_highlights,
  })
  vim.o.statusline = "%!v:lua.require'config.statusline'.render()"
end

return M
