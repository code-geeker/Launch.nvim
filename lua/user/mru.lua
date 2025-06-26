return {
   {
    "recent-files",
    enabled = false -- 禁用自动从git下载
  },
  {
    event = {"BufRead", "VimEnter"},
    config = function()
      local cache_path = vim.fn.stdpath("cache") .. "/recent_files.json"
      local recent_files = vim.fn.filereadable(cache_path) == 1 
          and vim.fn.json_decode(vim.fn.readfile(cache_path)) 
          or {}

      -- 更新最近文件列表
      local function update_recent(path)
        if path == "" or vim.fn.filereadable(path) == 0 then return end
        
        -- 使用更高效的重复检查
        recent_files = vim.tbl_filter(function(f) return f ~= path end, recent_files)
        table.insert(recent_files, 1, path)
        if #recent_files > 100 then table.remove(recent_files) end
      end

      -- 自动命令组
      vim.api.nvim_create_autocmd({"BufRead", "BufEnter"}, {
        callback = function(args)
          update_recent(vim.api.nvim_buf_get_name(args.buf))
          vim.fn.writefile({vim.fn.json_encode(recent_files)}, cache_path)
        end,
      })

      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function() vim.fn.writefile({vim.fn.json_encode(recent_files)}, cache_path) end,
      })

      -- Picker 功能
      local function show_recent()
        local items = {}
        for i, path in ipairs(recent_files) do
          if vim.fn.filereadable(path) == 1 then
            local filename = vim.fn.fnamemodify(path, ":t")
            table.insert(items, {
              idx = i,
              display = {
                filename = filename,
                filepath = vim.fn.fnamemodify(path, ":~:.:h")
              },
              path = path
            })
          end
        end

        require("snacks").picker({
          title = "Recent",
          items = items,
          format = function(item)
            return {
              {item.display.filename},
              {" ⋮"..item.display.filepath, "Comment"}
            }
          end,
          confirm = function(picker, item)
            picker:close()
            vim.schedule(function()
              vim.cmd("e "..vim.fn.fnameescape(item.path))
            end)
          end
        })
      end

      vim.keymap.set("n", "<leader>fr", show_recent, {desc = "Recent files"})
    end
  }
}
