-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ----------------------------------------------------------------------------------------------
-- AUTO SAVE SETUP
vim.o.updatetime = 1000 -- Trigger autosave after 1 second of inactivity

local autosave_enabled = false

-- Define an autocommand group to manage autosave more reliably
vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })

function ToggleAutosave()
  if autosave_enabled then
    -- Disable autosave by clearing the group
    vim.api.nvim_clear_autocmds({ group = "AutoSaveGroup" })
    autosave_enabled = false
    vim.api.nvim_out_write("Autosave Disabled\n")
  else
    -- Enable autosave with autocommands in the defined group
    vim.api.nvim_create_autocmd({ "CursorHold", "TextChanged" }, {
      group = "AutoSaveGroup",
      pattern = "*",
      command = "silent! write",
    })
    autosave_enabled = true
    vim.api.nvim_out_write("Autosave Enabled\n")
  end
end

-- Keybinding to toggle autosave
vim.keymap.set("n", "<leader>tt", ToggleAutosave, { silent = true })

-- ----------------------------------------------------------------------------------------------
-- CODE RUNNER:
-- Function to run code inside the first terminal pane (or create one if none exist)
function RunCodeInTerminal()
  local ft = vim.bo.filetype
  local filename = vim.fn.expand("%:p") -- Get the absolute path of the current file
  local output_name = filename:gsub("%.%w+$", "")
  local cmd = {
    python = "python3 " .. filename,
    javascript = "node " .. filename,
    c = "gcc " .. filename .. " -o " .. output_name .. " && " .. output_name,
    cpp = "g++ " .. filename .. " -o " .. output_name .. " && " .. output_name,
    java = "javac " .. filename .. " && java " .. vim.fn.fnamemodify(output_name, ":t"),
    sh = "bash " .. filename,
  }

  if not cmd[ft] then
    print("No run command set for filetype: " .. ft)
    return
  end

  -- Check for existing terminal pane
  local terminals = vim.api.nvim_list_wins()
  local term_buf = nil
  local term_chan = nil

  for _, win in ipairs(terminals) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      term_buf = buf
      term_chan = vim.api.nvim_buf_get_var(buf, "terminal_job_id") -- Get terminal job ID
      break
    end
  end

  if term_buf and term_chan then
    -- Move to the terminal window
    vim.api.nvim_set_current_win(vim.fn.win_id2win(term_buf))
    -- Ensure we are in Insert mode
    vim.api.nvim_feedkeys("i", "n", false)
    -- Send the command
    vim.fn.chansend(term_chan, cmd[ft] .. "\n")
  else
    -- Open a new terminal split
    vim.cmd("split | terminal")
    -- Wait a moment for the terminal to be ready
    vim.defer_fn(function()
      local new_term_buf = vim.api.nvim_get_current_buf() -- Get the new terminal buffer
      local new_term_chan = vim.api.nvim_buf_get_var(new_term_buf, "terminal_job_id") -- Get terminal job ID
      -- Ensure Insert mode is active
      vim.api.nvim_feedkeys("i", "n", false)
      -- Send the command
      vim.fn.chansend(new_term_chan, cmd[ft] .. "\n")
    end, 100) -- Small delay to ensure terminal is ready
  end
end

-- Map it to <leader>r
vim.keymap.set("n", "<leader>r", RunCodeInTerminal, { noremap = true, silent = true })

-- ----------------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
  end,
})
