local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      explorer = { 
        enabled = true,


      },
      indent = { enabled = true },
      input = { enabled = true },
      dashboard = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        enabled = true,
        formatters = {
          file = {
            filename_first = true,
            truncate = 100,
            filename_only = false,
            icon_width = 2,
            git_status_hl = true,
          },
        },
        matcher = {
          frecency = true,
          history_bonus = true,
        },
        win = {
          -- input window
          list = {
            keys = {
              ["<Tab>"] = { "confirm", mode = { "i", "n" } },

            }
          }
        },
         sources = {
          explorer = {
            -- focus = "input",
            -- auto_close = true,
          },
        },
      },
      image = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true }
        }
      },

    })

    vim.api.nvim_command('highlight! link SnacksPickerDir LineNr')

    vim.api.nvim_command('highlight! link SnacksDashboardHeader DraculaPurpleBold')

    vim.api.nvim_command('highlight! link SnacksDashboardIcon DraculaPurpleBold')

    vim.api.nvim_command('highlight! link SnacksDashboardDesc Normal')

    vim.api.nvim_command('highlight! link SnacksDashboardFooter DraculaPurpleBold')




  local wk = require "which-key"
  wk.add{
    { "<leader>e", "<cmd>lua Snacks.explorer()<CR>", desc = "Explorer", icon = { icon = "󰙅", color = "orange" } },
  }



vim.api.nvim_create_autocmd("WinClosed", {
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local count = 0
    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      local bt = vim.api.nvim_buf_get_option(buf, "buftype")
      if bt == "" then
        count = count + 1
      end
    end

    if count == 0 then
      --[[ pcall(function()
        require("snacks.picker.explorer").actions.quit()
      end) ]]

      vim.cmd("qa")
    end
  end,
})



  end
}

return M
