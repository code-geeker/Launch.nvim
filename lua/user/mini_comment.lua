local M = {
  "echasnovski/mini.comment",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
}

function M.config()

  vim.g.skip_ts_context_commentstring_module = true
  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }
  require('mini.comment').setup {
    options = {
      custom_commentstring = function()
        -- return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
        return "--1 %s"
      end,
    },
  }
end

return M
