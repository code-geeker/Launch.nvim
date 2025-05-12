local M = {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}


function M.config()
  require("codecompanion").setup {
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "AIzaSyAL64ghjUR95zN3kLzI8o3QHj1H1y9FKvw",
             -- model = "gemini-2.0-flash"
            model = "gemini-2.5-pro-exp-03-25"
          },
        })
      end,
    },
    strategies = {
      inline = {
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
    },
  }

end

return M


