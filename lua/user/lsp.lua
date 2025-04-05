-- u/see https://github.com/neovim/nvim-lspconfig/blob/ff6471d4f837354d8257dfa326b031dd8858b16e/lua/lspconfig/util.lua#L23-L28
local bufname_valid = function (bufname)
  if bufname:match '^/' or bufname:match '^[a-zA-Z]:' or bufname:match '^zipfile://' or bufname:match '^tarfile:' then
    return true
  end

  return false
end

local function configure_diagnostics()
  vim.diagnostic.config({
    virtual_text = { current_line = true },
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.INFO] = '',
        [vim.diagnostic.severity.HINT] = '󰌵',
      },
    },
    float = {
      border = "rounded",
      source = "if_many",
    },
  })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    -- Stop the LSP client on invalid buffers
    -- u/see https://github.com/neovim/nvim-lspconfig/blob/ff6471d4f837354d8257dfa326b031dd8858b16e/lua/lspconfig/configs.lua#L97-L99
    if (#bufname ~= 0 and not bufname_valid(bufname)) then
      client.stop()
      return;
    end

    -- Here the rest of LSP config
    configure_diagnostics()

  end,
})

-- vim.lsp.config('*', {
--  capabilities = require('cmp_nvim_lsp').default_capabilities(),
-- })


  vim.lsp.enable({
    "lua-ls",
    "pylsp",
    "ts_ls",
    "gopls",
    "html",
    "intelephense"
  })
