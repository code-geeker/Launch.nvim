local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}


function M.config()
  local servers = {
    "lua_ls",
    -- "cssls",
    -- "html",
    -- "ts_ls",
    "basedpyright",
    -- "bashls",
    -- "jsonls",
    "gopls",
    "intelephense"
  }

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
