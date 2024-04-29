local M = {
  "stevearc/dressing.nvim",
  opts = {},
  event = "VeryLazy",
}

function M.config()
  require("dressing").setup {}
end

return M
