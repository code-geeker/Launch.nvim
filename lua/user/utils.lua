-- lua/custom/utils.lua
local M = {}

M.copy_current_buffer_path = function()
  local filepath = vim.fn.expand("%:p") -- 绝对路径
  local filename = vim.fn.expand("%:t") -- 文件名
  local modify = vim.fn.fnamemodify

  local results = {
    modify(filepath, ":."),    -- 相对 CWD 的路径
    filepath,                  -- 绝对路径
    modify(filepath, ":~"),    -- 相对 HOME 的路径
    filename,                  -- 文件名
    modify(filename, ":r"),    -- 不带扩展名的文件名
    modify(filename, ":e"),    -- 文件扩展名
  }

  -- 使用 vim.ui.select 供用户选择
  vim.ui.select({
    "1. Path relative to CWD: " .. results[1],
    "2. Absolute path: " .. results[2],
    "3. Path relative to HOME: " .. results[3],
    "4. Filename: " .. results[4],
    "5. Filename without extension: " .. results[5],
    "6. Extension of the filename: " .. results[6],
  }, { prompt = "Choose to copy to clipboard:" }, function(choice)
    if choice then
      local i = tonumber(choice:sub(1, 1))
      if i then
        local result = results[i]
        vim.fn.setreg('*', result) -- 复制到系统剪贴板
        vim.notify("Copied: " .. result)
      else
        vim.notify("Invalid selection")
      end
    else
      vim.notify("Selection cancelled")
    end
  end)
end


M.get_neotree_width = function()
  -- 遍历所有窗口，识别 neo-tree 特征
  for _, win_id in ipairs(vim.api.nvim_list_wins()) do
    local buf_id = vim.api.nvim_win_get_buf(win_id)
    local buf_name = vim.api.nvim_buf_get_name(buf_id)
    local filetype = vim.api.nvim_buf_get_option(buf_id, "filetype")

    -- 判断是否为 neo-tree 窗口
    if string.find(buf_name, "NeoTree") or filetype == "neo-tree" then
      return vim.api.nvim_win_get_width(win_id)  -- 直接返回宽度
    end
  end
  -- 未找到窗口时返回 nil 并提示
  vim.notify("未找到 NeoTree 窗口", vim.log.levels.WARN)
  return nil
end

return M
