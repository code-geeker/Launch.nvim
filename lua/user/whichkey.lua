local M = {
  "folke/which-key.nvim",

}
-- :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
function M.config()
  --[[ local mappings = {
    v = { "<cmd>vsplit<CR>", "Split" },
    h = {"<cmd>BufferLineCyclePrev<CR>","BufferLineCyclePrev"},
    l = {"<cmd>BufferLineCycleNext<CR>","BufferLineCycleNext"},
    g = { name = "Git" },
    m = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    r = { "<cmd>Telescope frecency<cr>", "Frecent File" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    w = { "<cmd>Telescope grep_string<cr>", "Search Word" },
    s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  } ]]

  local mappings = {
    { "<leader>1", "<cmd>lua require('bufferline').go_to(1, true)<cr>", desc = "Buffer 1", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>2", "<cmd>lua require('bufferline').go_to(2, true)<cr>", desc = "Buffer 2", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>3", "<cmd>lua require('bufferline').go_to(3, true)<cr>", desc = "Buffer 3", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>4", "<cmd>lua require('bufferline').go_to(4, true)<cr>", desc = "Buffer 4", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>5", "<cmd>lua require('bufferline').go_to(5, true)<cr>", desc = "Buffer 5", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>6", "<cmd>lua require('bufferline').go_to(6, true)<cr>", desc = "Buffer 6", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>7", "<cmd>lua require('bufferline').go_to(7, true)<cr>", desc = "Buffer 7", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>8", "<cmd>lua require('bufferline').go_to(8, true)<cr>", desc = "Buffer 8", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>9", "<cmd>lua require('bufferline').go_to(9, true)<cr>", desc = "Buffer 9", mode = "n", icon = { icon = "󰓩", color = "blue" } },
    { "<leader>h", "<cmd>BufferLineCyclePrev<CR>", desc = "Buffer Prev", mode = "n", icon = { icon = "", color = "blue" } },
    { "<leader>l", "<cmd>BufferLineCycleNext<CR>", desc = "Buffer Next", mode = "n", icon = { icon = "", color = "blue" } },
    { "<leader>m", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files", mode = "n" },
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files", mode = "n" },
    { "<leader>w", "<cmd>Telescope grep_string<cr>", desc = "Search Word", mode = "n" },

    -- { "<leader>w", "<cmd>w<cr>", desc = "Save", mode = "n" },

    { "<leader>s", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", mode = "n", icon = { icon = "", color = "orange" } },
    { "<leader>c", "<cmd>Telescope git_status<cr>", desc = "Git Unstaged Files", mode = "n", icon = { icon = "󱀺", color = "orange" } },

    {"<leader>g", "", desc = "Git"},

    { "<leader>p", "<cmd>lua require('user.utils').copy_current_buffer_path()<cr>", desc = "Copy File Path", mode = "n", icon = { icon = "", color = "green" } },

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
    windows= {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
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

  -- which_key.register(mappings, opts)
  which_key.add(mappings, opts)
end



return M
