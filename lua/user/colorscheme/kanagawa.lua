local M = {
  "rebelot/kanagawa.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()

  vim.cmd.colorscheme "kanagawa"
  -- vim.cmd("highlight Normal guibg=#1e1f29")

  -- vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#101010]]
  -- vim.cmd [[hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#101010 guifg=NONE]]

  -- vim.cmd[[hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#1e1f27 guifg=NONE]]

end

return M
