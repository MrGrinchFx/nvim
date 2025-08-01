-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert") -- optional: start in insert mode
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.cuh",
  command = "set filetype=cpp",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.cuh", "*.cu" },
  callback = function()
    vim.bo.filetype = "cuda"
  end,
  desc = "Set filetype for CUDA files",
})

-- You can add other custom autocommands here as well.
