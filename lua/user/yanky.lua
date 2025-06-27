local M = {
  "gbprod/yanky.nvim",
  opts = { },
  dependencies = { "folke/snacks.nvim" },
  event = "VeryLazy",
}

function M.config()
  local Snacks = require("snacks")

  local wk = require "which-key"
  wk.add{
      { "<leader>y", "<cmd>lua require('picker-yank').show()<CR>", desc = "Yank History", mode = "n", icon = { icon = "󰒡", color = "blue" } },
  }

require("yanky").setup({
  preserve_cursor_position = {
    enabled = false,
  },
})
end

return  M
