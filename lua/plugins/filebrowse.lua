return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("file_browser")

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = "Telescope file browser" }

    -- Open file browser in current working directory
    keymap("n", "<space>ff", ":Telescope file_browser<CR>", opts)

    -- Open file browser at current buffer's directory, select current file
    keymap("n", "<space>fb", function()
      local path = vim.fn.expand("%:p:h")
      require("telescope").extensions.file_browser.file_browser({
        path = path,
        select_buffer = true,
      })
    end, vim.tbl_extend("force", opts, { desc = "File browser at current buffer" }))
  end,
}
