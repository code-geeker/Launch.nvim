local M = {
  "hedyhli/outline.nvim",
  event = "VeryLazy",
   keys = {
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
}

function M.config()
  require('outline').setup()
end

return M
