return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6", -- or omit if you want latest
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      -- put your telescope config here if needed
    })
    local builtin = require("telescope.builtin")
    local keymap = vim.keymap.set
    keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    keymap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
  end,
}
