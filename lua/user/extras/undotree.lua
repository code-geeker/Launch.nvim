local M = {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = {
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}

function M.config()
  require("undotree").setup()
end

return M
