local M = {
  "nvim-pack/nvim-spectre",
}

function M.config()
  require('spectre').setup({
    -- is_block_ui_break = true
  })
end

return M
