return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2", -- check if the plugin uses this branch
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })
    local keymap = vim.keymap.set
    local silent = { noremap = true, silent = true }

    -- Add file to harpoon list
    keymap("n", "<leader>fa", function()
      harpoon:list():add()
    end, silent)

    -- Toggle harpoon UI
    keymap("n", "<leader>lf", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, silent)

    -- Navigate to files 1–4
    keymap("n", "<leader>1", function()
      harpoon:list():select(1)
    end, silent)
    keymap("n", "<leader>2", function()
      harpoon:list():select(2)
    end, silent)
    keymap("n", "<leader>3", function()
      harpoon:list():select(3)
    end, silent)
    keymap("n", "<leader>4", function()
      harpoon:list():select(4)
    end, silent)
  end,
}
