-- Linear-style syntax roles for the zen colorschemes, drawn from their own palette.
local M = {}

local DIFF_LINE_TINT = 0.12

function M.on_colors(c)
  local util = require("aether.utils")
  c.diff.add = util.blend_bg(c.green, DIFF_LINE_TINT)
  c.diff.delete = util.blend_bg(c.red, DIFF_LINE_TINT)
end

function M.on_highlights(hl, c)
  local roles = {
    keyword = { fg = c.purple },
    variable = { fg = c.bright_blue },
    property = { fg = c.orange },
    string = { fg = c.yellow },
    callable = { fg = c.cyan },
    number = { fg = c.cyan },
    type = { fg = c.green },
  }

  local groups = {
    keyword = {
      "Keyword",
      "Statement",
      "Conditional",
      "Repeat",
      "Exception",
      "StorageClass",
      "@keyword",
      "@keyword.function",
      "@keyword.return",
      "@keyword.coroutine",
      "@keyword.storage",
      "@keyword.conditional",
      "@keyword.repeat",
      "@keyword.exception",
      "@keyword.import",
      "@keyword.modifier",
      "@keyword.type",
    },
    variable = {
      "Identifier",
      "Boolean",
      "@variable",
      "@variable.builtin",
      "@boolean",
      "@constant.builtin",
      "@lsp.type.variable",
    },
    property = {
      "@property",
      "@variable.member",
      "@variable.parameter",
      "@lsp.type.property",
      "@lsp.type.parameter",
    },
    string = { "String", "Character", "@string" },
    callable = {
      "Function",
      "@function",
      "@function.call",
      "@function.method",
      "@function.method.call",
      "@function.builtin",
      "@constructor",
      "@lsp.type.function",
      "@lsp.type.method",
    },
    number = { "Number", "Float", "@number", "@number.float" },
    type = {
      "Type",
      "Typedef",
      "Structure",
      "@type",
      "@type.builtin",
      "@type.definition",
      "@lsp.type.type",
      "@lsp.type.class",
      "@lsp.type.interface",
      "@lsp.type.struct",
      "@lsp.type.enum",
      "@lsp.type.typeParameter",
    },
  }

  for role, names in pairs(groups) do
    for _, name in ipairs(names) do
      hl[name] = roles[role]
    end
  end
end

return M
