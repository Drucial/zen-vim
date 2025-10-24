-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  group = augroup("trim_whitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Close certain filetypes with q
autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = {
    "help",
    "lspinfo",
    "man",
    "qf",
    "query",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Disable auto-commenting on new line
autocmd("BufEnter", {
  group = augroup("disable_auto_comment", { clear = true }),
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = augroup("restore_cursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Check if file changed outside of vim
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime", { clear = true }),
  command = "checktime",
})

-- Resize splits on window resize
autocmd("VimResized", {
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Open dashboard when closing last buffer
autocmd("BufDelete", {
  group = augroup("close_to_dashboard", { clear = true }),
  callback = function(event)
    vim.schedule(function()
      -- Get all buffers
      local buffers = vim.api.nvim_list_bufs()

      -- Special filetypes to ignore
      local special_filetypes = {
        "snacks_dashboard",
        "dashboard",
        "oil",
        "trouble",
        "qf",
        "help",
        "lspinfo",
        "TelescopePrompt",
        "lazy",
        "mason",
        "notify",
        "noice",
      }

      -- Count real buffers
      local real_buffers = 0
      for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_valid(buf) then
          local buftype = vim.bo[buf].buftype
          local filetype = vim.bo[buf].filetype
          local listed = vim.bo[buf].buflisted
          local bufname = vim.api.nvim_buf_get_name(buf)

          -- Check if it's a "real" buffer (listed, normal file, not special)
          local is_special = false
          for _, ft in ipairs(special_filetypes) do
            if filetype == ft then
              is_special = true
              break
            end
          end

          -- Count as real if: listed, normal buftype, not special, AND has a name
          if listed and buftype == "" and not is_special and bufname ~= "" then
            real_buffers = real_buffers + 1
          end
        end
      end

      -- DEBUG: Uncomment to debug buffer counting
      -- print("Real buffers remaining: " .. real_buffers)

      -- If no real buffers remain, open dashboard
      if real_buffers == 0 then
        local current_buf = vim.api.nvim_get_current_buf()
        local current_buftype = vim.bo[current_buf].buftype
        local current_filetype = vim.bo[current_buf].filetype
        local current_name = vim.fn.bufname(current_buf)

        -- DEBUG: Uncomment to debug dashboard opening
        -- print("Opening dashboard. Current buffer: " .. current_name .. ", buftype: " .. current_buftype .. ", filetype: " .. current_filetype)

        -- Don't open dashboard if we're already on dashboard or in a special buffer
        if current_filetype ~= "snacks_dashboard" and current_filetype ~= "dashboard" then
          if current_buftype == "" and current_name == "" then
            require("snacks").dashboard()
          end
        end
      end
    end)
  end,
})
