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

return M
