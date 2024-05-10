local M = {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  }

  wk.register {
    ["<leader>/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment", mode = "v" },
  }

  vim.g.skip_ts_context_commentstring_module = true
  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }


  require('ts_context_commentstring').setup {
    custom_calculation = function(node, language_tree)
      local filename = vim.fn.expand('%:t')
      -- print(language_tree:lang())
      if language_tree:lang() == 'html' then
        if filename:match("%.blade.php$") then
          return "{{-- %s --}}"
        elseif  filename:match("%.cfm$") or filename:match("%.cfc$") then
          return "<!--- %s --->"
        else
          return nil
        end
      else
        return nil
      end
    end,
  }

  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }

  local ft = require('Comment.ft')
  ft.cf = {'<!--- %s --->', '<!--- %s --->'}

end

return M
