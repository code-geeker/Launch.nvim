local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
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
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    modules ={},
    ensure_installed = { "html", "css", "javascript", "lua", "vimdoc", "php", "php_only", "phpdoc", "markdown", "bash", "python", "yaml" },
    highlight = { enable = true, additional_vim_regex_highlighting = false,  --[[ disable = { "php" }  ]]},
    indent = { enable = true },
    matchup = {
      enable = true,              -- mandatory, false will disable the whole extension
      include_match_words = true,
    },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@jsx.element",
          ["]f"] = "@function.outer",
          ["]m"] = "@class.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]M"] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = "@jsx.element",
          ["[f"] = "@function.outer",
          ["[m"] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[M"] = "@class.outer",
        },
      },
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["~"] = "@parameter.inner",
        },
      },
    },
  }

vim.g._ts_force_sync_parsing = true
end

return M
