-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- Lua
-- 1. Define a custom function to jump and conditionally center
local function jump_and_maybe_center(key)
  local count = vim.v.count

  -- If a count is provided (e.g., `5j`), `vim.v.count` will be > 0.
  if count > 0 then
    -- Construct the command string with the count, the key, and 'zz'
    local cmd_string = "normal! " .. count .. key .. "zz"
    vim.cmd(cmd_string)
  else
    -- If no count is provided (e.g., just `j`),
    -- simply perform the normal motion and do nothing else.
    -- We can achieve this by doing nothing at all, since `j` and `k`
    -- are already default motions. We are just un-mapping them
    -- and then conditionally executing a custom command.
    -- This approach is a bit inefficient and can cause a flicker.
    -- A better way is to not remap the key if no count is provided.
    -- The next code block will show a more elegant solution.
    vim.cmd("normal! " .. key)
  end
end

-- 2. Define the keymaps
-- 'n' is for normal mode
vim.keymap.set("n", "j", function()
  -- If a count is provided, execute the jump and center command
  if vim.v.count > 0 then
    vim.cmd("normal! " .. vim.v.count .. "jzz")
  else
    -- Otherwise, do nothing. Neovim will handle the normal `j` motion
    -- because the keymap function returns, and the default behavior
    -- of the key is not overridden in this case.
    vim.cmd("normal! j") -- Re-executing the 'j' motion
  end
end, { desc = "Jump down, center with count" })

vim.keymap.set("n", "k", function()
  if vim.v.count > 0 then
    vim.cmd("normal! " .. vim.v.count .. "kzz")
  else
    vim.cmd("normal! k")
  end
end, { desc = "Jump up, center with count" })

-- We can do the same for arrow keys
vim.keymap.set("n", "<Up>", function()
  if vim.v.count > 0 then
    vim.cmd("normal! " .. vim.v.count .. "kzz")
  else
    vim.cmd("normal! k")
  end
end, { desc = "Jump up, center with count" })

vim.keymap.set("n", "<Down>", function()
  if vim.v.count > 0 then
    vim.cmd("normal! " .. vim.v.count .. "jzz")
  else
    vim.cmd("normal! j")
  end
end, { desc = "Jump down, center with count" })
