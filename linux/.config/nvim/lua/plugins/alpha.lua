return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons", "ibhagwan/fzf-lua" },
    opts = function(_, dashboard)
      -- `lazyvim.plugins.extras.ui.alpha` creates this dashboard before picker
      -- extras extend it. Keeping customization in `opts` preserves that chain.
      local message = {
        type = "text",
        val = "doo bee doo bee doo aaa",
        opts = {
          hl = "Comment",
          position = "center",
        },
      }

      local image_path = vim.fn.expand("~/Pictures/wolhaiksong2.jpg")
      if vim.fn.executable("ascii-image-converter") == 1 and vim.fn.filereadable(image_path) == 1 then
        dashboard.section.header.val = vim.fn.systemlist({
          "ascii-image-converter",
          image_path,
          "-b",
          "--width",
          "50",
        })
      end

      dashboard.section.header.opts.hl = "Statement"
      dashboard.section.buttons.opts.hl = "Number"
      dashboard.section.buttons.val = {
        dashboard.button("C", "⚙️  Config", ":lua require('fzf-lua').files({cwd=vim.fn.stdpath('config')})<CR>"),
        dashboard.button("U", "🔄  Update", ":Lazy update<CR>"),
        dashboard.button("F", "🔎  Find file", ":lua require('fzf-lua').files()<CR>"),
        dashboard.button("R", "⏳  Recent files", ":lua require('fzf-lua').oldfiles()<CR>"),
      }

      dashboard.opts.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 1 },
        message,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }

      return dashboard
    end,
    config = function(_, dashboard)
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          vim.opt_local.fillchars = { eob = " " }
        end,
      })

      require("alpha").setup(dashboard.opts)
    end,
  },
}
