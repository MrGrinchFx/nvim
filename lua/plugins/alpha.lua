return {
  "goolord/alpha-nvim",

  opts = function(_, opts)
    local header = require("plugins.header_imgs.garfield")
    local dashboard = require("alpha.themes.dashboard")

    opts.section.header.val = header

    opts.section.buttons.val = {
      dashboard.button("u", "󰚰  Update plugins", "<cmd>Lazy update<CR>"),
      dashboard.button("f", "󰈞  Find Files", "<cmd>Telescope find_files<CR>"),
      dashboard.button("g", "󰊄  Live Grep", "<cmd>Telescope live_grep<CR>"),
    }
    return opts
  end,
}
