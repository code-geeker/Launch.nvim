local M = {
  "preservim/tagbar",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"

  wk.add{
      { "<leader>o", "<cmd>TagbarToggle<CR>", desc = "Toggle taglist", mode = "n" }
  }

end

return M
