local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>o"] = { "<cmd>Navbuddy<cr>", "Nav" },
  }

  local navbuddy = require "nvim-navbuddy"
  -- local actions = require("nvim-navbuddy.actions")
  navbuddy.setup {
    window = {
      border = "rounded",
    },
    icons = require("user.icons").kind,
    lsp = { auto_attach = true },
     source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
    },
  }

  local opts = { noremap = true, silent = true }

  --[[ local keymap = vim.api.nvim_set_keymap
  keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
  keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts) ]]


  vim.api.nvim_command('highlight link NavbuddyScope DraculaSelection')
  vim.api.nvim_command('highlight link NavbuddyName Search')


end

return M
