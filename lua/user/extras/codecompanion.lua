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
            api_key = "AIzaSyAAXFkgaMzWTVOjEsg0CtIvYyzCyVQEA8k",
             model = "gemini-2.0-flash"
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


