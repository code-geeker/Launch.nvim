local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    q = { "<cmd>confirm q<CR>", "Quit" },
    v = { "<cmd>vsplit<CR>", "Split" },
    h = {"<cmd>BufferLineCyclePrev<CR>","BufferLineCyclePrev"},
    l = {"<cmd>BufferLineCycleNext<CR>","BufferLineCycleNext"},
    m = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    w = { "<cmd>Telescope grep_string<cr>", "Search Word" },
    s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
