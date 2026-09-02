-- Gutter signs and hunk actions. Snacks covers the rest of git (pickers,
-- lazygit, blame, browse) but has no sign-column integration.
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(buffer)
      local gs = require("gitsigns")
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
      end

      map("n", "]h", function()
        gs.nav_hunk("next")
      end, "Next hunk")
      map("n", "[h", function()
        gs.nav_hunk("prev")
      end, "Previous hunk")

      map("n", "<leader>gh", gs.stage_hunk, "Stage hunk")
      map("v", "<leader>gh", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("n", "<leader>gu", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>gu", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")
      map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk")
    end,
  },
}
