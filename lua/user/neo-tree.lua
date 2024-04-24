
local M = {
  "nvim-neo-tree/neo-tree.nvim",
  version = '*',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
}

function M.config()

end

return M
