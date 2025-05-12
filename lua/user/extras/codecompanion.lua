local M = {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}


-- This function configures the "codecompanion" plugin
function M.config()
  require("codecompanion").setup {
    adapters = {
      gemini = function()
        -- Extend the "gemini" adapter with additional environment settings
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            -- Specify the model to be used for the "gemini" adapter
            -- api_key is commented out for security reasons
            model = "gemini-2.5-pro-exp-03-25"
          },
        })
      end,
    },
    strategies = {
      inline = {
        keymaps = {
          accept_change = {
            -- Keymap for accepting the suggested change in normal mode
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            -- Keymap for rejecting the suggested change in normal mode
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },
    },
  }
end


return M


