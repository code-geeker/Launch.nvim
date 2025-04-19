local M = {
  "linrongbin16/gentags.nvim",
  event = "VeryLazy"
}

function M.config()
  require('gentags').setup{
    disabled_filetypes = {
      "NvimTree",
      "neo-tree",
      "oil",
    },
    debug = {
      -- enable debug mode
      enable = true,

      -- print logs to messages.
      console_log = true,

      -- write logs to file.
      -- For *NIX: `~/.local/share/nvim/gentags.log`.
      -- For Windows: `$env:USERPROFILE\AppData\Local\nvim-data\gentags.log`.
      file_log = true,
    },
    ctags = {
      "--tag-relative=never",
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
      "--exclude=*.log",
    },
  }
end

return M

