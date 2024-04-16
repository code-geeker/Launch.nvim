local M = {
  -- "nvim-pack/nvim-spectre",
  "n1ckisthereu/nvim-spectre",
   branch = "pcre2-support",
}

function M.config()
  require('spectre').setup({
    default = {
      replace = {
        cmd = "oxi"
      }
    }
  })
end

return M
