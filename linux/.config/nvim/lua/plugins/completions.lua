return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    -- Remove this:
    -- version = "*",

    opts = {
      keymap = {
        preset = "default",
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      signature = {
        enabled = true,
      },

      -- Add this explicitly to avoid LazyVim's cmdline keymap defaults
      -- causing problems with older/newer blink schemas.
      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
        },
      },
    },
  },
}
