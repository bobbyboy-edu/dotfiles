return {
  "karb94/neoscroll.nvim",
  opts = {
    -- Keys mapped to their default scrolling animations.
    mappings = {
      "<C-u>",
      "<C-d>",
      "<C-b>",
      "<C-f>",
      "<C-y>",
      "<C-e>",
      "zt",
      "zz",
      "zb",
    },

    hide_cursor = true,
    stop_eof = true,
    respect_scrolloff = false,
    cursor_scrolls_alone = true,
    duration_multiplier = 1.0,
    easing = "linear",
    performance_mode = false,

    -- Events ignored while scrolling.
    ignored_events = {
      "WinScrolled",
      "CursorMoved",
    },
  },
}
