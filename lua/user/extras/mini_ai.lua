local M = {
 "echasnovski/mini.ai",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
    },
}

function M.config()

  require('mini.ai').setup({
    n_lines = 150,
    custom_textobjects = {
      o = require('mini.ai').gen_spec.treesitter({
        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
      }, {}),
      f = require('mini.ai').gen_spec.treesitter(
        { a = "@function.outer", i = "@function.inner" },
        {}
      ),
      --[[ c = require('mini.ai').gen_spec.treesitter(
        { a = "@class.outer", i = "@class.inner" },
        {}
      ), ]]
      t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
      d = { "%f[%d]%d+" }, -- digits
      e = { -- Word with case
        {
          "%u[%l%d]+%f[^%l%d]",
          "%f[%S][%l%d]+%f[^%l%d]",
          "%f[%P][%l%d]+%f[^%l%d]",
          "^[%l%d]+%f[^%l%d]",
        },
        "^().*()$",
      },

      -- Tweak argument textobject
      a = require('mini.ai').gen_spec.argument({ brackets = { '%b()' } }),

      -- Whole buffer
      g = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line('$'),
          col = math.max(vim.fn.getline('$'):len(), 1)
        }
        return { from = from, to = to }
      end
    }
  })
end

return M
