return {
  {
    "karb94/neoscroll.nvim",
    opts = {},
    config = function()
      require("neoscroll").setup({
        hide_cursor = false,
      })
    end
  }
}
