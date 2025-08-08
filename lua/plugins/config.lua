return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- or remove this line to not lazy load
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
