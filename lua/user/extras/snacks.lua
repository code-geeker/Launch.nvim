local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      explorer = {
        enabled = false,
      },
      indent = { enabled = true },
      input = { enabled = true },
      dashboard = { enabled = false },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        enabled = true,
        -- title = "TEST",
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
          list = {
            keys = {
              ["<Tab>"] = { "confirm", mode = { "i", "n" } },
              ["Y"] = "copy_file_path",
              ["s"] = "search_in_directory",
            }
          },
        },
         sources = {
          files = {
            hidden = true,
            layout = {
              preview = false,
              layout = { -- the layout itself
                box = "horizontal",
                backdrop = false,
                width = 0.3, -- 0 is max
                height = 0.5,
                {
                  box = "vertical",
                  border = "rounded",
                  title = "Files",
                  { win = "input", height = 1, border = "bottom" },
                  { win = "list", border = "none" },
                },
              }
            }
          },
          recent = {
            layout = {
              preset = "telescope",
              reverse = true,
              layout = {
                box = "horizontal",
                backdrop = false,
                width = 0.8,
                height = 0.9,
                border = "none",
                {
                  box = "vertical",
                  { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                  { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
                },
                {
                  win = "preview",
                  title = "{preview:Preview}",
                  width = 0.55,
                  border = "rounded",
                  title_pos = "center",
                },
              },

            }
          },
          explorer = {
            -- focus = "input",
            -- auto_close = true,
            hidden = true,
            layout = {
              auto_hide = { "input" },
              -- preset = "default",
              -- preview = false,
            layout = {
                backdrop = false,
                width = 40,
                min_width = 40,
                height = 0,
                position = "left",
                border = "none",
                box = "vertical",
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = "{title}",
                  title_pos = "center",
                },
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", height = 0.4, border = "top" },
              },

            },
            actions = {
              copy_file_path = {
                action = function(_, item)
                  if not item then
                    return
                  end
                  local vals = {
                    ["Path relative to CWD"] = vim.fn.fnamemodify(item.file, ":."),
                    ["Path relative to HOME"] = vim.fn.fnamemodify(item.file, ":~"),
                    ["Absolute path"] = item.file,
                    ["Filename"] = vim.fn.fnamemodify(item.file, ":t"),
                    ["Filename without extension"] = vim.fn.fnamemodify(item.file, ":t:r"),
                    ["Extension of the filename"] = vim.fn.fnamemodify(item.file, ":t:e"),
                    ["URI"] = vim.uri_from_fname(item.file),
                  }

                  local options = vim.tbl_filter(function(val)
                    return vals[val] ~= ""
                  end, vim.tbl_keys(vals))
                  if vim.tbl_isempty(options) then
                    vim.notify("No values to copy", vim.log.levels.WARN)
                    return
                  end
                  table.sort(options)
                  vim.ui.select(options, {
                    prompt = "Choose to copy to clipboard:",
                    format_item = function(list_item)
                      return ("%s: %s"):format(list_item, vals[list_item])
                    end,
                  }, function(choice)
                      local result = vals[choice]
                      if result then
                        vim.fn.setreg("+", result)
                        Snacks.notify.info("Yanked `" .. result .. "`")
                      end
                    end)
                end,
              },
              search_in_directory = {
                action = function(_, item)
                  if not item then
                    return
                  end

                  local dir = vim.fn.fnamemodify(item.file, ":p:h")
                  Snacks.picker.grep({
                    cwd = dir,
                    cmd = "rg",
                    args = {
                      "-g",
                      "!.git",
                      "-g",
                      "!node_modules",
                      "-g",
                      "!dist",
                      "-g",
                      "!build",
                      "-g",
                      "!coverage",
                      "-g",
                      "!.DS_Store",
                      "-g",
                      "!.docusaurus",
                      "-g",
                      "!.dart_tool",
                    },
                    show_empty = true,
                    hidden = true,
                    ignored = true,
                    follow = false,
                    supports_live = true,
                  })
                end,
              },
            }

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


    --[[ vim.api.nvim_command('highlight! link SnacksDashboardHeader DraculaPurpleBold')
    vim.api.nvim_command('highlight! link SnacksDashboardIcon DraculaPurpleBold')
    vim.api.nvim_command('highlight! link SnacksDashboardDesc Normal')
    vim.api.nvim_command('highlight! link SnacksDashboardFooter DraculaPurpleBold') ]]

    vim.api.nvim_command('highlight! link SnacksPickerDir LineNr')

    -- explorer
    --[[ vim.api.nvim_command('highlight! link SnacksPickerDirectory DraculaPurpleBold')
    vim.api.nvim_command('highlight! Directory guifg=#8094b4')
    vim.api.nvim_command('highlight! SnacksPickerPathHidden  guifg=#8094b4') ]]

       vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#45475A', bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'SnacksPickerTitle', { bg = '#7aa2f7', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerPreview', { bg = '#1a1b26' })
      vim.api.nvim_set_hl(0, 'SnacksPickerList', { bg = '#1a1b26' })
      vim.api.nvim_set_hl(0, 'SnacksPickerListTitle', { bg = '#9ece6a', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInputTitle', { bg = '#f7768e', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = '#1a1b26', fg = '#45475a' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInputSearch', { bg = '#f7768e', fg = '#1f2335' })
      vim.api.nvim_set_hl(0, 'SnacksPickerInput', { bg = '#1a1b26' })


  local wk = require "which-key"
  wk.add{
      -- { "<leader>e", "<cmd>lua Snacks.explorer()<CR>", desc = "Explorer", icon = { icon = "󰙅", color = "orange" } },

      { "<leader>s", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Live Grep", mode = "n", icon = { icon = "", color = "orange" } },
      { "<leader>w", "<cmd>lua Snacks.picker.grep_word()<cr>", desc = "Word Grep", mode = { "n", "x" },icon = { icon = "", color = "blue" } },

      { "<leader>u", "<cmd>lua Snacks.picker.undo()<cr>", desc = "Undotree", icon = { icon = "", color = "red" } },
  }

-- quit nvim if explorer is the last window
vim.api.nvim_create_autocmd('QuitPre', {
    callback = function()
        local snacks_windows = {}
        local floating_windows = {}
        local windows = vim.api.nvim_list_wins()
        for _, w in ipairs(windows) do
            local filetype = vim.api.nvim_get_option_value('filetype', { buf = vim.api.nvim_win_get_buf(w) })
            if filetype:match('snacks_') ~= nil then
                table.insert(snacks_windows, w)
            elseif vim.api.nvim_win_get_config(w).relative ~= '' then
                table.insert(floating_windows, w)
            end
        end
        if 1 == #windows - #floating_windows - #snacks_windows then
            -- Should quit, so we close all Snacks windows.
            for _, w in ipairs(snacks_windows) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end,
})


  end
}

return M
