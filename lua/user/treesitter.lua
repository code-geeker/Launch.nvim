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

  --[[ parser_config.cf = {
    install_info = {
      url = "~/www/tree-sitter-cfml",
      files = {"cfml/src/parser.c"},
      branch = "master",
    },
    filetype = "cf"
  } ]]


  --[[ vim.filetype.add({
    pattern = {
      [".*%.blade%.php"] = "blade",
    },
  }) ]]


  require("nvim-treesitter.configs").setup {
    --[[ sync_install = false,
    auto_install = true,
    ignore_install = {},
    modules ={}, ]]

    ensure_installed = { "html", "css", "javascript", "lua", "vimdoc", "php", "php_only", "phpdoc", "markdown", "bash", "python", "yaml" },
    highlight = { enable = true, additional_vim_regex_highlighting = false,  --[[ disable = { "php" }  ]]},
    indent = { enable = true },
    matchup = {
      enable = true,              -- mandatory, false will disable the whole extension
      disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    },
  }
end

return M
