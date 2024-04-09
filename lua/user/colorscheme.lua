local M = {
  -- "LunarVim/darkplus.nvim",
  "dracula/vim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.cmd.colorscheme "dracula"

  vim.cmd[[hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=#1e1f27 guifg=NONE]]
  vim.cmd[[hi Visual ctermfg=17 ctermbg=228 cterm=NONE guifg=#282a36 guibg=#f1fa8c gui=NONE]]

  -- vim.cmd.colorscheme "darkplus"
end

return M
