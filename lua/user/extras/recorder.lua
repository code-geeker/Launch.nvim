local M = {
  "chrisgrieser/nvim-recorder",
 dependencies = "rcarriga/nvim-notify",
 opts = {}
}

function M.config()
  require("recorder").setup {}
end

return M
