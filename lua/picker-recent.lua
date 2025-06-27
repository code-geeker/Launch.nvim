local M = {}

function M.show()
  -- 每次显示时加载最新文件
  if _G.load_recent_files_for_picker then
    _G.load_recent_files_for_picker()
  end
  local items = {}
  for i, path in ipairs(_G.recent_files) do
    if vim.fn.filereadable(path) == 1 then
      table.insert(items, {
        idx = i,
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
    matcher = {
      fuzzy = false,
    },
    layout = {
      preset = "telescope",
      reverse = true,
      -- preview = true,
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
    },
    items = items,
  })
end

return M
