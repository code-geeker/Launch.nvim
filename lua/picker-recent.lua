local M = {}

function M.show()
  -- 每次显示时加载最新文件
  if _G.load_recent_files_for_picker then
    _G.load_recent_files_for_picker()
  end

  local items = {}
  local util = require("snacks.util")


  -- Load web-devicons if available
  local has_devicons = pcall(require, "nvim-web-devicons")
  
  for i, path in ipairs(_G.recent_files) do
    if vim.fn.filereadable(path) == 1 then
      local filename = vim.fn.fnamemodify(path, ":t")
      local filepath = vim.fn.fnamemodify(path, ":~:.:h")
      local icon, icon_hl = "", ""
      

      if has_devicons then
        icon, icon_hl = util.icon(vim.fn.fnamemodify(filename, ":e"), 'extension')
      end

      -- print(vim.fn.fnamemodify(path, ":~:."))
      table.insert(items, {
        idx = i,
        display = {
          filename = filename,
          filepath = filepath,
          icon = icon,
          icon_hl = icon_hl
        },
        file = path,
        path = path,
        preview = true,
        -- text = path,
        text = vim.fn.fnamemodify(path, ":~:.")
      })

    end
  end


  Snacks.picker({
    title = "Recent",
    layout = {
      preset = "telescope",
      preview = true,
    },
    items = items,
  })
end

return M
