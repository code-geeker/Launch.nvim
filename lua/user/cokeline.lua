local M = {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "nvim-tree/nvim-web-devicons", -- If you want devicons
    "stevearc/resession.nvim"       -- Optional, for persistent history
  },
  config = true
}


function M.config()

  require('cokeline').setup({
    components = {
    {
      text = function(buffer) return buffer.index .. ': ' end,
    },
    }
  })

end
return M
