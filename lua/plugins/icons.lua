return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      -- your options, usually defaults are fine
      color_icons = true,
    })
  end,
}
