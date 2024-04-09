local M = {
  "ggandor/leap.nvim",
  -- event = "VeryLazy",
}

function M.config()
  require("leap").create_default_mappings()
end
vim.g["sneak#label"] = true

return M
