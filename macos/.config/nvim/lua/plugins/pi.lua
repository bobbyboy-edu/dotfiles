return {
  {
    name = "pi-yank-reference",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    config = function()
      local function copy(text)
        vim.fn.setreg("+", text)
        vim.notify("Copied: " .. text)
      end

      local function visual_range()
        local file = vim.fn.expand("%:p")
        local s = vim.fn.line("v")
        local e = vim.fn.line(".")

        if s > e then
          s, e = e, s
        end

        return file, s, e
      end

      vim.keymap.set("n", "<leader>pl", function()
        local file = vim.fn.expand("%:p")
        local line = vim.fn.line(".")
        copy(string.format("Inspect `%s` line %d.", file, line))
      end, { desc = "Copy pi inspect current line prompt" })

      vim.keymap.set("v", "<leader>pa", function()
        local file, s, e = visual_range()
        copy(string.format("Inspect `%s` lines %d-%d.", file, s, e))
      end, { desc = "Copy pi inspect selected lines prompt" })

      vim.keymap.set("v", "<leader>pm", function()
        local file, s, e = visual_range()
        copy(string.format("Modify `%s` lines %d-%d.", file, s, e))
      end, { desc = "Copy pi modify line reference" })
    end,
  },
}
