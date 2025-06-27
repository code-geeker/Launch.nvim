--[[ vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd "syntax sync fromstart"
  end,
}) ]]

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
  pattern = { "!vim" }, -- Exclude internal vim buffers if needed, though checktime might be safe
  callback = function()
    -- Combine actions for BufWinEnter
    vim.cmd "set formatoptions-=cro" -- From the first BufWinEnter
    vim.cmd "checktime"             -- From the second BufWinEnter
  end,
})

--[[ The original separate BufWinEnter for checktime is now merged above
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "!vim" },
  callback = function()
    vim.cmd "checktime"
  end,
})
]]

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 160 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    local status_ok, luasnip = pcall(require, "luasnip")
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})


-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   desc = "Automatically remove trailing blank lines",
--   command = [[%s/\(\n\s*\)\+\%$//e]],
-- })


-- blade.php 有问题
--[[ vim.api.nvim_create_autocmd("BufWritePre", {   
  pattern = { "*.php", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
}) ]]


vim.cmd[[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]


--[[ vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  desc = "",
  command = "let @/ = ''",
}) ]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "snipe-menu",
  callback = function(args)
    -- 绑定 WinLeave 事件（不限制单次触发）
    vim.api.nvim_create_autocmd("WinLeave", {
      buffer = args.buf,
      callback = function()
        if vim.bo.filetype == "snipe-menu" then
          vim.api.nvim_win_close(0, true) -- 强制关闭窗口
        end
      end,
    })
  end,
})


function PhpHelp()
  local word = vim.fn.expand("<cword>")
  local ok, _ = pcall(vim.cmd, "help " .. word)
  if not ok then
    vim.notify("No help available for: " .. word, vim.log.levels.WARN)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "K", ":lua PhpHelp()<CR>", { noremap = true, silent = true })
  end,
})


vim.api.nvim_create_user_command('TSNodeInfo', function()
    local ts_utils = require('nvim-treesitter.ts_utils')
    local node = ts_utils.get_node_at_cursor()
    if node then
        print("Node type:", node:type())
        print("Node text:", vim.treesitter.get_node_text(node, 0))
    else
        print("No node found under cursor")
    end
end, {})



--- start recent files ---

local cache_path = vim.fn.stdpath("cache") .. "/recent_files.json"

-- Recent files list
_G.recent_files = _G.recent_files or {}

-- 加载缓存文件
local function load_recent_files()
  if vim.fn.filereadable(cache_path) == 1 then
    local lines = vim.fn.readfile(cache_path)
    local ok, data = pcall(vim.fn.json_decode, table.concat(lines, "\n"))
    if ok and type(data) == "table" then
      _G.recent_files = data
    end
  end
end

-- 保存到缓存文件
local function save_recent_files()
  local encoded = vim.fn.json_encode(_G.recent_files)
  if encoded then
    vim.fn.writefile({ encoded }, cache_path)
  end
end

-- 更新 recent 文件
local function add_file(path)
  if path == '' or vim.fn.filereadable(path) == 0 then return end

  -- 移除重复项
  for i, f in ipairs(_G.recent_files) do
    if f == path then
      table.remove(_G.recent_files, i)
      break
    end
  end
  
  -- 添加到列表开头
  table.insert(_G.recent_files, 1, path)
  
  -- 限制列表长度
  if #_G.recent_files > 100 then
    table.remove(_G.recent_files)
  end
end

-- 初始化：开机加载
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = load_recent_files,
-- })

-- 退出时保存
--[[ vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = save_recent_files,
}) ]]

-- 访问文件时更新并保存
vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  callback = function(args)
    local fname = vim.api.nvim_buf_get_name(args.buf)
    load_recent_files()
    add_file(fname)
    save_recent_files()  -- 每次访问文件后立即保存
  end,
})

-- 为picker提供加载函数（通过全局变量）
_G.load_recent_files_for_picker = load_recent_files

--- end recent files ---
