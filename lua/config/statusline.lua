local M = {}

local MAX_PATH = 50
local MAX_BRANCH = 20

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

local SEVERITIES = {
  { vim.diagnostic.severity.ERROR, "", "DiagnosticError" },
  { vim.diagnostic.severity.WARN, "", "DiagnosticWarn" },
  { vim.diagnostic.severity.INFO, "", "DiagnosticInfo" },
  { vim.diagnostic.severity.HINT, "", "DiagnosticHint" },
}

local function diagnostics(buf)
  local counts = {}
  for _, d in ipairs(vim.diagnostic.get(buf)) do
    counts[d.severity] = (counts[d.severity] or 0) + 1
  end

  local parts = {}
  for _, severity in ipairs(SEVERITIES) do
    local n = counts[severity[1]]
    if n then
      parts[#parts + 1] = "%#" .. severity[3] .. "#" .. severity[2] .. " " .. n .. "%*"
    end
  end
  return table.concat(parts, " ")
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
  local prefix = ""
  if parts[1] == "" then
    prefix = "/"
    table.remove(parts, 1)
  end
  if #parts <= 2 then
    return path
  end
  return prefix .. parts[1] .. "/…/" .. parts[#parts]
end

local function path(buf, root)
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" or vim.bo[buf].buftype ~= "" then
    return ""
  end
  local rel = root and name:sub(#root + 2) or vim.fn.fnamemodify(name, ":~:.")
  return shorten(rel)
end

-- Read .git/HEAD directly rather than spawning git, so this stays cheap enough
-- to run on every statusline redraw. Cached per root; cleared on the autocmds
-- in setup().
local branches = {}

local function branch(root)
  local cached = branches[root]
  if cached ~= nil then
    return cached ~= "" and cached or nil
  end

  local git = root .. "/.git"
  local stat = vim.uv.fs_stat(git)
  if stat and stat.type == "file" then
    local link = (vim.fn.readfile(git, "", 1)[1] or ""):match("^gitdir: (.+)$")
    git = link and vim.fs.normalize(link) or git
  end

  local head = (vim.fn.readfile(git .. "/HEAD", "", 1) or {})[1] or ""
  local name = head:match("^ref: refs/heads/(.+)$") or head:sub(1, 7)
  if #name > MAX_BRANCH then
    name = name:sub(1, MAX_BRANCH - 1) .. "…"
  end

  branches[root] = name
  return name ~= "" and name or nil
end

function M.clear_cache()
  branches = {}
end

function M.render()
  local buf = vim.api.nvim_get_current_buf()
  if vim.bo[buf].filetype == "snacks_dashboard" then
    return ""
  end

  local mode = MODES[vim.api.nvim_get_mode().mode] or MODES.n
  local block = "%#StatusMode" .. mode[1] .. "#"
  local root = git_root(buf)

  local right = ""
  if root then
    local head = branch(root)
    right = (head and head .. " " or "") .. block .. " " .. vim.fs.basename(root) .. " %*"
  end

  local diag = diagnostics(buf)

  return table.concat({
    block .. " " .. mode[1] .. " %*",
    " ",
    path(buf, root),
    diag ~= "" and "  " .. diag or "",
    "%=",
    right,
  })
end

function M.setup()
  M.apply_highlights()
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("statusline-highlights", { clear = true }),
    callback = M.apply_highlights,
  })
  vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "DirChanged" }, {
    group = vim.api.nvim_create_augroup("statusline-git", { clear = true }),
    callback = M.clear_cache,
  })
  vim.o.statusline = "%!v:lua.require'config.statusline'.render()"
end

return M
