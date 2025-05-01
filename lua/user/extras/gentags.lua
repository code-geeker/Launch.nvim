local M = {
  "JMarkin/gentags.lua",
  event = "VeryLazy",
  cond = vim.fn.executable("ctags") == 1,
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- lazy = true,
  },
opts = {}
}

function M.config()

  require("gentags").setup {
    async = true, -- run ctags asynchronous
    bin = "ctags",
    --[[ args = { -- extra args
      "--extras=+r+q",
      "--exclude=.git",
      "--exclude=node_modules*",
      "--exclude=.mypy*",
      "--exclude=.pytest*",
      "--exclude=.ruff*",
      "--exclude=BUILD",
      "--exclude=vendor*",
      "--exclude=*.min.*",
    }, ]]



    args = {
      "--extras=+r+q",
      "--exclude=.git",
      "--exclude=node_modules*",
      "--exclude=.mypy*",
      "--exclude=.pytest*",
      "--exclude=.ruff*",
      "--exclude=BUILD",
      "--exclude=vendor*",
      "--exclude=*.min.*",
      "--exclude=cache*",
      "--exclude=build*",
      "--exclude=dist*",
      "--exclude=bin*",
      "--exclude=bower_components*",
      "--exclude=*-lock.json",
      "--exclude=*.lock",
      "--exclude=*.css",
      "--exclude=*.html",
      "--exclude=*.tpl",
      "--exclude=*.js",
      "--exclude=*.min.*",
      "--exclude=*.bak",
      "--exclude=*.zip",
      "--exclude=*.pyc",
      "--exclude=*.class",
      "--exclude=*.sln",
      "--exclude=*.csproj",
      "--exclude=*.csproj.user",
      "--exclude=*.tmp",
      "--exclude=*.cache",
      "--exclude=tags*",
      "--exclude=*.vscode",
      "--exclude=*.pdb",
      "--exclude=*.exe",
      "--exclude=*.dll",
      "--exclude=*.bin",
      "--exclude=*.mp3",
      "--exclude=*.ogg",
      "--exclude=*.flac",
      "--exclude=*.swp",
      "--exclude=*.swo",
      "--exclude=.DS_Store",
      "--exclude=*.plist",
      "--exclude=*.bmp",
      "--exclude=*.gif",
      "--exclude=*.ico",
      "--exclude=*.jpg",
      "--exclude=*.png",
      "--exclude=*.svg",
      "--exclude=*.rar",
      "--exclude=*.zip",
      "--exclude=*.tar",
      "--exclude=*.tar.gz",
      "--exclude=*.tar.xz",
      "--exclude=*.tar.bz2",
      "--exclude=*.pdf",
      "--exclude=*.doc",
      "--exclude=*.docx",
      "--exclude=*.ppt",
      "--exclude=*.pptx",
      "--exclude=*.xls",
      "--exclude=*.scss",
      "--exclude=*.log",
    },


    -- mapping ctags --languages <-> neovim filetypes
    lang_ft_map = {
      ["Python"] = { "python" },
      ["Lua"] = { "lua" },
      ["Vim"] = { "vim" },
      ["C,C++,CUDA"] = { "c", "cpp", "h", "cuda" },
      ["JavaScript"] = { "javascript" },
      ["Go"] = { "go" },
      ["PHP"] = { "php" },
      ["ColdFusion"] = { "cf" },
    }

  }

end

return M
