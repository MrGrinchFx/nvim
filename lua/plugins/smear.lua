return {
  "sphamba/smear-cursor.nvim",

  opts = {
    enabled = true,
    smear_beween_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
    smear_between_buffers = true,
    stiffness = 0.6,
    trailing_stiffness = 0.5,
    time_interval = 7,
    distance_stop_animating = 0.5,
    stiffness_insert_mode = 0.7,
    trailing_stiffness_insert_mode = 0.7,
    damping = 0.8,
    damping_insert_mode = 0.8,
    cterm_cursor_colors = { 150, 121, 105, 255 },
    cterm_bg = 255,
  },
}
