return {
  {
    "jim-at-jibba/ariake-vim-colors",
    lazy = false, -- or remove this line to not lazy load
    config = function()
      vim.cmd.colorscheme("ariake")
    end,
  },
}
