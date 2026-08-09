return {
  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_no_mappings = 1
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_bracketed_paste = 1

      local tmux_socket = vim.env.TMUX and vim.split(vim.env.TMUX, ",")[1] or "default"
      vim.g.slime_default_config = {
        socket_name = tmux_socket,
        target_pane = "{last}",
      }
    end,
    keys = {
      { "<leader>rs", "<Plug>SlimeMotionSend", mode = "n", remap = true, desc = "Send motion to REPL" },
      { "<leader>rs", "<Plug>SlimeRegionSend", mode = "x", remap = true, desc = "Send selection to REPL" },
      { "<leader>rl", "<Plug>SlimeLineSend", mode = "n", remap = true, desc = "Send line to REPL" },
      { "<leader>rp", "<Plug>SlimeParagraphSend", mode = "n", remap = true, desc = "Send paragraph to REPL" },
      { "<leader>rf", ":%SlimeSend<CR>", mode = "n", desc = "Send file to REPL" },
      { "<leader>rc", "<Plug>SlimeConfig", mode = "n", remap = true, desc = "Configure REPL target" },
    },
  },
}
