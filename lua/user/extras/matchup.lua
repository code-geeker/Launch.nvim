local M = {
  "andymass/vim-matchup",
}

function M.config()
  -- vim.g.matchup_enabled = 0
  -- vim.g.matchup_matchparen_offscreen = { method = nil }
  vim.g.matchup_matchparen_offscreen = { method = "popup" }
  vim.g.matchup_matchpref = { html = { nolists = 1 } }

--   vim.cmd [[
-- augroup matchup_matchparen_disable_ft
--   autocmd!
--   autocmd FileType lua let [b:matchup_matchparen_fallback,
--       \ b:matchup_matchparen_enabled] = [0, 0]
-- augroup END
-- ]]

  vim.cmd [[hi MatchParen cterm=none ctermfg=84 gui=none guifg=#F45F5F]]
end

return M
