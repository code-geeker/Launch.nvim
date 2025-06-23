local M = {
  "dracula/vim",
  -- "Mofiqul/dracula.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 2000, -- make sure to load this before all the other start plugins
}

function M.config()

  vim.cmd.colorscheme "dracula"
  -- vim.o.background = "dark"
  vim.cmd("highlight Normal guibg=#1e1f29")


  vim.cmd [[highlight ColorColumn ctermbg=0 guibg=#101010]]
  vim.cmd [[hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#101010 guifg=NONE]]

  -- vim.cmd[[hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#1e1f27 guifg=NONE]]
  -- vim.cmd[[hi Visual ctermfg=17 ctermbg=228 cterm=NONE guifg=#282a36 guibg=#f1fa8c gui=NONE]]

  -- vim.cmd.colorscheme "darkplus"
end

return M
