local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()

  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.blade = {
    install_info = {
      url = "https://github.com/EmranMR/tree-sitter-blade",
      files = {"src/parser.c"},
      branch = "main",
    },
    filetype = "blade"
  }


  --[[ vim.filetype.add({
    pattern = {
      [".*%.blade%.php"] = "blade",
    },
  }) ]]


  require("nvim-treesitter.configs").setup {
    ensure_installed = { "html", "css", "javascript", "lua", "vimdoc", "php", "php_only", "markdown", "markdown_inline", "bash", "python" },
      highlight = { enable = true },
      indent = { enable = true },
  }
end

return M
