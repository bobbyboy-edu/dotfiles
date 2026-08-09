return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- Set Skim as the macOS viewer
    vim.g.vimtex_view_method = "skim"

    -- Optional: Automatically open Skim on successful compilation
    vim.g.vimtex_view_skim_activate = 1

    -- Optional: Keep focus on Neovim when shifting to Skim
    vim.g.vimtex_view_skim_reading_bar = 0
  end,
}
