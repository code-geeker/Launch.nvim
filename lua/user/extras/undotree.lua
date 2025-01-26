local M = {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
}

function M.config()

  local wk = require "which-key"
  wk.add{
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undotree", icon = "" },
  }

  require("undotree").setup()
end

return M
