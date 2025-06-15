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
              ["Y"] = "copy_file_path",
              ["s"] = "search_in_directory",
            }
          }
        },
         sources = {
          explorer = {
            -- focus = "input",
            -- auto_close = true,
            hidden = true,
            --[[ layout = {
              preset = "default",
              preview = false,
            }, ]]
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
        local normal_count = 0
        local snacks_explorer_found = false

        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          local bt = vim.api.nvim_buf_get_option(buf, "buftype")
          local ft = vim.api.nvim_buf_get_option(buf, "filetype")

          -- print("win: " .. win .. " buf: " .. buf .. " bt: " .. bt .. " ft: " .. ft )
          -- 普通 buffer（非特殊类型）
          if bt == "" and ft ~= "" then
            normal_count = normal_count + 1
          end

          -- snacks explorer buffer
          if ft == "snacks_layout_box" then
            snacks_explorer_found = true
          end
        end
        -- 没有普通窗口，且 snacks explorer 还存在 → 退出 snacks explorer
        if normal_count == 0 and snacks_explorer_found then
          vim.cmd("qa")
        end

      end,
    })


  end
}

return M
