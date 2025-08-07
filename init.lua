-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.textwidth = 130
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.cuh",
  command = "set filetype=cuda",
})
vim.o.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme ariake]])
