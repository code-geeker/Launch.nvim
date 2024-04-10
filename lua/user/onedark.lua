local M = {
  "navarasu/onedark.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}



function M.config()

  require('onedark').setup {
    style = 'darker'
  }

  require('onedark').load()

  -- vim.cmd.colorscheme "darkplus"
end

return M
